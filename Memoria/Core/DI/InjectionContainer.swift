//
//  InjectionContainer.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 19/04/23.
//

import Foundation
import CoreData
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

            return DestinationViewModel(
                getTripArea: getTripArea,
                getDestinations: getTripDestination,
                generateRecommendations: generateRecommendation)

        }
    }
}
