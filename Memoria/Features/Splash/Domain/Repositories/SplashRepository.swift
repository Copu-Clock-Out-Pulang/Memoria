//
//  SplashRepository.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 05/05/23.
//

import Foundation
import Combine

protocol SplashRepository {
    func migrateArea() -> AnyPublisher<Void, Failure>
    //    func migrateDestination() -> AnyPublisher<Void, Failure>
}
