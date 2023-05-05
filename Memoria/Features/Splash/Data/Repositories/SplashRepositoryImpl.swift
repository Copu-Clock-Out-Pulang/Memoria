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
    
    init(areaMigration: AreaMigration){
        self.areaMigration = areaMigration
    }
    
    
    func migrateArea() -> AnyPublisher<Void, Failure> {
        return areaMigration.addArea()
    }
    
//    func migrateDestination() -> AnyPublisher<Void, Failure> {
//        <#code#>
//    }
    
    
}
