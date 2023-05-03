//
//  CreateScrapBook.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 28/04/23.
//

import Foundation
import Combine

protocol CreateScrapBook: UseCaseProtocol {
    associatedtype ReturnType = ScrapBook
    associatedtype Params = CreateScrapBookParams
}

class CreateScrapBookImpl: CreateScrapBook {

    let repository: ScrapBookRepository

    init(repository: ScrapBookRepository) {
        self.repository = repository
    }
    func execute(params: CreateScrapBookParams) -> AnyPublisher<ScrapBook, Failure> {
        return repository.createScrapBook(form: params.form)
    }

}

struct CreateScrapBookParams: Equatable {
    let form: CreateScrapBookForm
}
