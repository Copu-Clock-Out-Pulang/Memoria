//
//  EditScrapBook.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation
import Combine

protocol EditScrapBook: UseCaseProtocol {
    associatedtype ReturnType = ScrapBook
    associatedtype Params = EditScrapBookParams
}

class EditScrapBookImpl: EditScrapBook {

    let repository: ScrapBookRepository

    init(repository: ScrapBookRepository) {
        self.repository = repository
    }

    func execute(params: EditScrapBookParams) -> AnyPublisher<ScrapBook, Failure> {
        return repository.editScrapBook(scrapBook: params.scrapBook, form: params.form)
    }
}

struct EditScrapBookParams: Equatable {
    let scrapBook: ScrapBook
    let form: EditScrapBookForm
}
