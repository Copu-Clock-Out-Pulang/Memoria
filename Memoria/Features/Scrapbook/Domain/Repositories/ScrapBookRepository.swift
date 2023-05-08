//
//  ScrapBookRepository.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 28/04/23.
//

import Foundation
import Combine

protocol ScrapBookRepository {
    func createScrapBook(form: CreateScrapBookForm) -> AnyPublisher <ScrapBook, Failure>

    func getScrapBooks() -> AnyPublisher <[ScrapBook], Failure>

    func editScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) -> AnyPublisher <ScrapBook, Failure>

    func deleteScrapBook(scrapBook: ScrapBook) -> AnyPublisher <(), Failure>
}
