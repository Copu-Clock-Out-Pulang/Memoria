//
//  GetScrapBook.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation
import Combine

protocol GetScrapBook: UseCaseProtocol {
    associatedtype ReturnType = [ScrapBook]
    associatedtype Params = NoParams
}

class GetScrapBookImpl: GetScrapBook {

    let repository: ScrapBookRepository

    init(repository: ScrapBookRepository) {
        self.repository = repository
    }
    func execute(params: NoParams) -> AnyPublisher<[ScrapBook], Failure> {
        return repository.getScrapBooks()
    }

}
