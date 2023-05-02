//
//  AddScrapPage.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 27/04/23.
//

import Foundation
import Combine

protocol AddScrapPage: UseCaseProtocol {
    associatedtype ReturnType = ScrapPage
    associatedtype Params = AddScrapPageParams
}


class AddScrapPageImpl: AddScrapPage {

    let repository: ScrapPageRepository

    init(repository: ScrapPageRepository) {
        self.repository = repository
    }

    func execute(params: AddScrapPageParams) -> AnyPublisher<ScrapPage, Failure> {
        let id = UUID()
        let createdAt = Date()
        let updatedAt = createdAt

        let newScrapPage = ScrapPage(
            id: id,
            name: params.name,
            thumbnail: params.thumbnail,
            content: params.content,
            createdAt: createdAt,
            updatedAt: updatedAt
        )
        return repository.addScrapPage(scrapPage: newScrapPage)
    }
}

struct AddScrapPageParams: Equatable {
    let name: String
    let thumbnail: String
    let content: String
}
