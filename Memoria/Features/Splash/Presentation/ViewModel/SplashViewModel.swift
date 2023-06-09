//
//  SplashViewModel.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 05/05/23.
//

import Foundation
import Combine

class SplashViewModel: ObservableObject {

    // MARK: - Attributes
    @Published private(set) var status: SplashViewState = .initial
    @Published private(set) var isNotFirstLaunch = false
    @Published private(set) var isOnBoardingDisplayed = false

    // MARK: - Cancellables
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Usecases
    private let migrateArea: AnyUseCase<Void, NoParams>
    private let migrateDestination: AnyUseCase<Void, NoParams>
    private let userDefaultController: UserDefaultController
    
    init(migrateArea: AnyUseCase<Void, NoParams>, migrateDestination: AnyUseCase<Void, NoParams>, userDefaultController: UserDefaultController) {
        self.migrateArea = migrateArea
        self.migrateDestination = migrateDestination
        self.userDefaultController = userDefaultController
        self.getIsNotFirstLaunch()
        self.getIsOnBoardingDisplayed()
    }

    func startAreaMigration() {
        if !isNotFirstLaunch {
            status = .areaMigration
            migrateArea.execute(params: NoParams())
                .flatMap {
                    self.migrateDestination.execute(params: NoParams())
                }
                .sink(receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.status = .areaMigrationSuccess

                    case .failure(let fail):
                        self?.status = .areaMigrationFailed(failure: fail)

                    }
                }, receiveValue: {
                    self.status = .areaMigrationSuccess

                })
                .store(in: &cancellables)
            self.status = .initial
            self.setNotFirstLaunch()

        }
        self.status = .navigateToNextSpage

    }

    func getIsNotFirstLaunch() {
        isNotFirstLaunch = userDefaultController.fetchIsNotFirstLaunch()
    }

    func setNotFirstLaunch() {
        isNotFirstLaunch = true
        userDefaultController.setIsNotFirstLaunch()
    }
    
    func getIsOnBoardingDisplayed() {
        isOnBoardingDisplayed = userDefaultController.isOnBoardingDisplayed()
    }
    
    func setIsOnBoardingDisplayed() {
        isOnBoardingDisplayed = true
        userDefaultController.setIsOnBoardingDisplayed()
    }
}


enum SplashViewState {
    case initial
    case areaMigration
    case areaMigrationSuccess
    case areaMigrationFailed(failure: Failure)
    case navigateToNextSpage
}
