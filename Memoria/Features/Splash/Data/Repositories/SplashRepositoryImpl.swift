//
//  SplashRepositoryImpl.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 05/05/23.
//

import Foundation
import Combine

class SplashRepositoryImpl: SplashRepository {

    let areaMigration: AreaMigration
    let destinationMigration: DestinationMigration

    init(areaMigration: AreaMigration, destinationMigration: DestinationMigration) {
        self.areaMigration = areaMigration
        self.destinationMigration = destinationMigration
    }


    func migrateArea() -> AnyPublisher<Void, Failure> {
        return areaMigration.addArea()
    }

    func migrateDestination() -> AnyPublisher<Void, Failure> {
        return destinationMigration.addDestinations()
    }


}
