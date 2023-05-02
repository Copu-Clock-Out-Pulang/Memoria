//
//  ScrapBookRepositoryImpl.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation
import Combine

class ScrapBookRepositoryImpl: ScrapBookRepository {

    let localDataSource: ScrapBookLocalDataSource

    init(localDataSource: ScrapBookLocalDataSource) {
        self.localDataSource = localDataSource
    }

    func createScrapBook(form: CreateScrapBookForm) -> AnyPublisher<ScrapBook, Failure> {
        return localDataSource.createScrapBook(scrapBook: ScrapBookCoreDataModel.fromDomain(form: form)).map { $0.toDomain() }.eraseToAnyPublisher()
    }

    func getScrapBooks() -> AnyPublisher<[ScrapBook], Failure> {
        return localDataSource.getScrapBooks()
            .map {
                $0.map {
                    $0.toDomain()
                }
            }
            .eraseToAnyPublisher()
    }
    func editScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) -> AnyPublisher<ScrapBook, Failure> {
        return localDataSource.editScrapBook(scrapBook: ScrapBookCoreDataModel.fromDomain(editForm: form, scrapBook: scrapBook)).map { $0.toDomain() }.eraseToAnyPublisher()
    }

    func deleteScrapBook(scrapBook: ScrapBook) -> AnyPublisher<(), Failure> {
        return localDataSource.deleteScrapBook(scrapBook: ScrapBookCoreDataModel.fromDomain(scrapBook: scrapBook)).eraseToAnyPublisher()
    }

}
