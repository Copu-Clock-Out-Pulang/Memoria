//
//  EditScrapPage.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 27/04/23.
//

import Foundation
import Combine

protocol EditScrapPage: UseCaseProtocol {
    associatedtype ReturnType = ScrapPage
    associatedtype Params = EditScrapPageParams
}

class EditScrapPageImpl: EditScrapPage {

    let repository: ScrapPageRepository

    init(repository: ScrapPageRepository) {
        self.repository = repository
    }

    func execute(params: EditScrapPageParams) -> AnyPublisher<ScrapPage, Failure> {
        let editedScrapPage = params.scrapPage.with(
            name: params.name,
            thumbnail: params.thumbnail,
            content: params.content,
            updatedAt: Date()
        )
        return repository.editScrapPage(scrapPage: editedScrapPage)
    }
}

struct EditScrapPageParams: Equatable {
    let scrapPage: ScrapPage
    let name: String
    let thumbnail: String
    let content: String
}
