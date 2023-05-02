//
//  DestinationRepositoryImpl.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 02/05/23.
//

import Foundation
import Combine

class DestinationRepositoryImpl: DestinationRepository {
    
    let localDataSource: DestinationLocalDataSource
    
    init(localDataSource: DestinationLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func fetchArea() -> AnyPublisher<[Area], Failure> {
        return localDataSource.fetchArea()
            .map {
                $0.map {
                    $0.toDomain()
                }
            }
        .eraseToAnyPublisher()
    }
    
    func fetchDestination(area: Area) -> AnyPublisher<[Destination], Failure> {
        return localDataSource.fetchDestinationByArea(id: area.id)
            .map {
                $0.map {
                    $0.toDomain()
                }
            }
            .eraseToAnyPublisher()
    }
    
    
}
