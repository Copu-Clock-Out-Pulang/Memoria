//
//  CreateScrapPage.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 27/04/23.
//

import Foundation
import Combine

protocol CreateScrapPage: UseCaseProtocol {
    associatedtype ReturnType = ScrapPage
    associatedtype Params = CreateScrapPageParams
}

class CreateScrapPageImpl: CreateScrapPage {

    let repository: ScrapPageRepository

    init(repository: ScrapPageRepository) {
        self.repository = repository
    }

    func execute(params: CreateScrapPageParams) -> AnyPublisher<ScrapPage, Failure> {
        let scrapPage = ScrapPage(id: UUID(), name: params.form.name, thumbnail: params.form.thumbnail, content: params.form.content, createdAt: Date.now, updatedAt: Date.now)
        return repository.createScrapPage(form: params.form, page: scrapPage )
    }

}

struct CreateScrapPageParams: Equatable {
    let form: CreateScrapPageForm
}
