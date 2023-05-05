//
//  MigrateArea.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 05/05/23.
//

import Foundation
import Combine

protocol MigrateArea: UseCaseProtocol {
    associatedtype ReturnType = Void
    associatedtype Params = NoParams
}

class MigrateAreaImpl: MigrateArea {

    private let repository: SplashRepository
    init(repository: SplashRepository) {
        self.repository = repository
    }

    func execute(params: NoParams) -> AnyPublisher<(), Failure> {
        return repository.migrateArea()
    }

}
