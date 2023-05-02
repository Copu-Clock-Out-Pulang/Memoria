//
//  DeleteScrapBook.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation
import Combine

protocol DeleteScrapBook: UseCaseProtocol {
    associatedtype ReturnType = Void
    associatedtype Params = DeleteScrapBookParams
}

class DeleteScrapBookImpl: DeleteScrapBook {

    let repository: ScrapBookRepository

    init(repository: ScrapBookRepository) {
        self.repository = repository
    }

    func execute(params: DeleteScrapBookParams) -> AnyPublisher<(), Failure> {
        repository.deleteScrapBook(scrapBook: params.scrapBook)
    }
}

struct DeleteScrapBookParams: Equatable {
    let scrapBook: ScrapBook
}
