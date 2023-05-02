//
//  GetScrapPage.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation
import Combine

protocol GetScrapPages: UseCaseProtocol {
    associatedtype ReturnType = [ScrapPage]
    associatedtype Params = NoParams
}

class GetScrapPagesImpl: GetScrapPages {

    let repository: ScrapPageRepository

    init(repository: ScrapPageRepository) {
        self.repository = repository
    }
    func execute(params: NoParams) -> AnyPublisher<[ScrapPage], Failure> {
        return repository.getScrapPages()
    }

}
