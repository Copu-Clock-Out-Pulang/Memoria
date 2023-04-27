//
//  GetTripDestinationByArea.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation
import Combine

protocol GetTripDestinationByArea: UseCaseProtocol {
    associatedtype ReturnType = [Destination]
    associatedtype Params = GetTripDestinationByAreaParams
}

class GetTripDestinationByAreaImpl: GetTripDestinationByArea {
    private let repository: DestinationRepository
    
    init(repository: DestinationRepository) {
        self.repository = repository
    }
    
    func execute(params: GetTripDestinationByAreaParams) -> AnyPublisher<[Destination], Failure> {
        repository.fetchDestination(area: params.area)
    }
    
}

struct GetTripDestinationByAreaParams: Equatable {
    let area: Area
}
