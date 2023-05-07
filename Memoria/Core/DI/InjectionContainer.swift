//
//  InjectionContainer.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 19/04/23.
//

import Foundation
import CoreData
import CoreImage.CIFilterBuiltins
import Swinject
import SwinjectAutoregistration

final class InjectionContainer {

    static let shared = InjectionContainer()
    private var _container: Container?

    var container: Container {
        get {
            guard let contain = _container else {
                let newContainer = buildContainer()
                _container = newContainer
                return newContainer
            }
            return contain
        }
        set {
            _container = newValue
        }
    }

    private func buildContainer() -> Container {
        let container = Container()
        // register component here
        self.registerSharedContainer(container)
        self.registerDestinationContainer(container)
        self.registerScrapBookContainer(container)
        self.registerScrapPageContainer(container)
        self.registerSplashContainer(container)

        self.registerScrapBookContainer(container)
        self.registerScrapPageContainer(container)
        return container
    }

    private func registerSharedContainer(_ container: Container) {
        container.register(PersistenceController.self) { _ in
            let controller = PersistenceController.shared
            return controller

        }
        .inObjectScope(.container)


        container.register(NSManagedObjectContext.self) { resolver in
            let controller = resolver.resolve(PersistenceController.self)!
            let context = controller.container.viewContext
            return context

        }
        .inObjectScope(.container)

        container.register(CIContext.self) { _ in
            return CIContext()
        }
        .inObjectScope(.container)

        container.register(AreaMigration.self) { resolver in

            let context = resolver.resolve(NSManagedObjectContext.self)!
            return AreaMigrationImpl(context: context)

        }
        .inObjectScope(.container)

        container.register(DestinationMigration.self) { resolver in
            let context = resolver.resolve(NSManagedObjectContext.self)!
            return DestinationMigration(context: context)

        }
        .inObjectScope(.container)


        container.register(UserDefaults.self) { _ in
            return UserDefaults.standard

        }
        .inObjectScope(.container)

        container.autoregister(
            UserDefaultController.self, initializer: UserDefaultsControllerImpl.init)
            .inObjectScope(.container)
    }

    private func registerDestinationContainer(_ container: Container) {
        container.autoregister(DestinationLocalDataSource.self, initializer: DestinationLocalDataSourceImpl.init)
        container.autoregister(DestinationRepository.self, initializer: DestinationRepositoryImpl.init)

        container.autoregister(ImageSegmentor.self, initializer: ImageSegmentorImpl.init)

        container.register(DestinationImageGenerator.self) { resolver in
            let segmentor = resolver.resolve(ImageSegmentor.self)!
            return DestinationImageGeneratorImpl(imageSegmentor: segmentor)

        }
        container.register(AnyUseCase<[Area], NoParams>.self, name: "GetTripArea") { resolver in
            let repo = resolver.resolve(DestinationRepository.self)!
            let usecase = GetTripAreaImpl(repository: repo)
            return usecase.eraseToAnyUseCase()
        }

        container.register(
            AnyUseCase<[Destination], GetTripDestinationByAreaParams>.self,
            name: "GetTripDestinationByArea") { resolver in
            let repo = resolver.resolve(DestinationRepository.self)!
            let usecase = GetTripDestinationByAreaImpl(repository: repo)
            return usecase.eraseToAnyUseCase()
        }

        container.register(
            AnyUseCase<[Recommendation], GenerateRecommendationParams>.self,
            name: "GenerateRecommendation") { resolver in
            let generator = resolver.resolve(DestinationImageGenerator.self)!
            let usecase = GenerateRecommendationImpl(generator: generator)
            return usecase.eraseToAnyUseCase()
        }

        container.register(DestinationViewModel.self) { resolver in
            let getTripArea = resolver.resolve(AnyUseCase<[Area], NoParams>.self, name: "GetTripArea")!
            let generateRecommendation = resolver.resolve(
                AnyUseCase<[Recommendation], GenerateRecommendationParams>.self,
                name: "GenerateRecommendation")!
            let getTripDestination = resolver.resolve(
                AnyUseCase<[Destination], GetTripDestinationByAreaParams>.self,
                name: "GetTripDestinationByArea")!
            let createScrapBook = resolver.resolve(AnyUseCase<ScrapBook, CreateScrapBookParams>.self, name: "CreateScrapBook")!
            return DestinationViewModel(
                getTripArea: getTripArea,
                getDestinations: getTripDestination,
                generateRecommendations: generateRecommendation,
                createScrapBook: createScrapBook
            
            )

        }
        .inObjectScope(.container)

        container.register(TripNameViewController.self) { resolver in
            return TripNameViewController(viewModel: resolver.resolve(DestinationViewModel.self)!)
        }
        container.register(TripDateViewController.self) { resolver in
            return TripDateViewController(viewModel: resolver.resolve(DestinationViewModel.self)!)
        }
    }

    private func registerSplashContainer(_ container: Container) {
        container.autoregister(SplashRepository.self, initializer: SplashRepositoryImpl.init)
        container.register(AnyUseCase<Void, NoParams>.self, name: "MigrateArea") { resolver in
            let repo = resolver.resolve(SplashRepository.self)!
            return AnyUseCase(useCase: MigrateAreaImpl(repository: repo))

        }
        container.register(AnyUseCase<Void, NoParams>.self, name: "MigrateDestination") { resolver in
            let repo = resolver.resolve(SplashRepository.self)!
            return AnyUseCase(useCase: MigrateDestinationImpl(repository: repo))

        }
        container.register(SplashViewModel.self) { resolver in
            let migrateArea = resolver.resolve(AnyUseCase<Void, NoParams>.self, name: "MigrateArea")!
            let migrateDestination = resolver.resolve(AnyUseCase<Void, NoParams>.self, name: "MigrateDestination")!
            let controller = resolver.resolve(UserDefaultController.self)!

            return SplashViewModel(
                migrateArea: migrateArea,
                migrateDestination: migrateDestination,
                userDefaultController: controller
            )

        }


    }
    private func registerScrapBookContainer(_ container: Container) {
        container.autoregister(ScrapBookLocalDataSource.self, initializer: ScrapBookLocalDataSourceImpl.init)
        container.autoregister(ScrapBookRepository.self, initializer: ScrapBookRepositoryImpl.init)

        container.register(AnyUseCase<ScrapBook, CreateScrapBookParams>.self, name: "CreateScrapBook") { resolver in
            let repo = resolver.resolve(ScrapBookRepository.self)!
            let usecase = CreateScrapBookImpl(repository: repo)
            return usecase.eraseToAnyUseCase()
        }

        container.register(AnyUseCase<ScrapBook, EditScrapBookParams>.self, name: "EditScrapBook") { resolver in
            let repo = resolver.resolve(ScrapBookRepository.self)!
            let usecase = EditScrapBookImpl(repository: repo)
            return usecase.eraseToAnyUseCase()
        }

        container.register(AnyUseCase<[ScrapBook], NoParams>.self, name: "GetScrapBook") { resolver in
            let repo = resolver.resolve(ScrapBookRepository.self)!
            let usecase = GetScrapBookImpl(repository: repo)
            return usecase.eraseToAnyUseCase()
        }

        container.register(AnyUseCase<Void, DeleteScrapBookParams>.self, name: "DeleteScrapBook") { resolver in
            let repo = resolver.resolve(ScrapBookRepository.self)!
            let usecase = DeleteScrapBookImpl(repository: repo)
            return usecase.eraseToAnyUseCase()
        }
        container.register(ScrapBookViewModel.self) {
            resolver in
            let createScrapBook = resolver.resolve(AnyUseCase<ScrapBook, CreateScrapBookParams>.self, name: "CreateScrapBook")!
            let editScrapBook = resolver.resolve(AnyUseCase<ScrapBook, EditScrapBookParams>.self, name: "EditScrapBook")!
            let getScrapBooks = resolver.resolve(AnyUseCase<[ScrapBook], NoParams>.self, name: "GetScrapBook")!
            let deleteScrapBook = resolver.resolve(AnyUseCase<Void, DeleteScrapBookParams>.self, name: "DeleteScrapBook")!
            return ScrapBookViewModel(createScrapBook: createScrapBook, getScrapBooks: getScrapBooks, editScrapBook: editScrapBook, deleteScrapBook: deleteScrapBook)
        }
    }

    private func registerScrapPageContainer(_ container: Container) {
        container.autoregister(ScrapPageLocalDataSource.self, initializer: ScrapPageLocalDataSourceImpl.init)
        container.autoregister(ScrapPageRepository.self, initializer: ScrapPageRepositoryImpl.init)

        container.register(AnyUseCase<ScrapPage, CreateScrapPageParams>.self, name: "CreateScrapPage") { resolver in
            let repo = resolver.resolve(ScrapPageRepository.self)!
            let usecase = CreateScrapPageImpl(repository: repo)
            return usecase.eraseToAnyUseCase()
        }

        container.register(AnyUseCase<ScrapPage, EditScrapPageParams>.self, name: "EditScrapPage") { resolver in
            let repo = resolver.resolve(ScrapPageRepository.self)!
            let usecase = EditScrapPageImpl(repository: repo)
            return usecase.eraseToAnyUseCase()
        }

        container.register(AnyUseCase<[ScrapPage], NoParams>.self, name: "GetScrapPages") { resolver in
            let repo = resolver.resolve(ScrapPageRepository.self)!
            let usecase = GetScrapPagesImpl(repository: repo)
            return usecase.eraseToAnyUseCase()
        }

        container.register(AnyUseCase<Void, DeleteScrapPageParams>.self, name: "DeleteScrapPage") { resolver in
            let repo = resolver.resolve(ScrapPageRepository.self)!
            let usecase = DeleteScrapPageImpl(repository: repo)
            return usecase.eraseToAnyUseCase()
        }
        container.register(ScrapPageViewModel.self) {
            resolver in
            let createScrapPage = resolver.resolve(AnyUseCase<ScrapPage, CreateScrapPageParams>.self, name: "CreateScrapPage")!
            let editScrapPage = resolver.resolve(AnyUseCase<ScrapPage, EditScrapPageParams>.self, name: "EditScrapPage")!
            let getScrapPages = resolver.resolve(AnyUseCase<[ScrapPage], NoParams>.self, name: "GetScrapPages")!
            let deleteScrapPage = resolver.resolve(AnyUseCase<Void, DeleteScrapPageParams>.self, name: "DeleteScrapPage")!
            return ScrapPageViewModel(createScrapPage: createScrapPage, getScrapPages: getScrapPages, editScrapPage: editScrapPage, deleteScrapPage: deleteScrapPage)
        }
    }
}
