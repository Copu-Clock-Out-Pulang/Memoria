//
//  GetTripArea.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation
import Combine

protocol GetTripArea: UseCaseProtocol {
    associatedtype ReturnType = [Area]
    associatedtype Params = NoParams
}

class GetTripAreaImpl: GetTripArea {
    private let repository: DestinationRepository

    init(repository: DestinationRepository) {
        self.repository = repository
    }

    func execute(params: NoParams) -> AnyPublisher<[Area], Failure> {
        repository.fetchArea()
    }


}
