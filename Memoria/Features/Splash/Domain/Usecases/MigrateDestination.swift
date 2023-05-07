//
//  MigrateDestination.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 06/05/23.
//

import Foundation
import Combine

protocol MigrateDestination: UseCaseProtocol {
    associatedtype ReturnType = Void
    associatedtype Params = NoParams
}

class MigrateDestinationImpl: MigrateDestination {

    private let repository: SplashRepository
    init(repository: SplashRepository) {
        self.repository = repository
    }

    func execute(params: NoParams) -> AnyPublisher<(), Failure> {
        return repository.migrateDestination()
    }

}

