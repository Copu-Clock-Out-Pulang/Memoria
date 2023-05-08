//
//  ScrapPageRepositoryImpl.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation
import Combine

class ScrapPageRepositoryImpl: ScrapPageRepository {

    let localDataSource: ScrapPageLocalDataSource

    init(localDataSource: ScrapPageLocalDataSource) {
        self.localDataSource = localDataSource
    }

    func createScrapPage(form: CreateScrapPageForm, page: ScrapPage) -> AnyPublisher<ScrapPage, Failure> {
        return localDataSource
            .createScrapPage(form: form)

            .map { $0.toDomain() }.eraseToAnyPublisher()
    }

    func editScrapPage(scrapPage: ScrapPage, form: EditScrapPageForm) -> AnyPublisher<ScrapPage, Failure> {
        return localDataSource.editScrapPage(scrapPage: scrapPage, form: form).map { $0.toDomain() }.eraseToAnyPublisher()
    }

    func deleteScrapPage(scrapPage: ScrapPage) -> AnyPublisher<Void, Failure> {
        return localDataSource.deleteScrapPage(scrapPage: scrapPage)
    }

    func getScrapPages() -> AnyPublisher<[ScrapPage], Failure> {
        return localDataSource.getScrapPages()
            .map {
                $0.map {
                    $0.toDomain()
                }
            }
            .eraseToAnyPublisher()

    }

}
