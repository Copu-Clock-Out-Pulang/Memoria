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
        return repository.editScrapPage(scrapPage: params.scrapPage, form: params.form)
    }
}

struct EditScrapPageParams: Equatable {
    let scrapPage: ScrapPage
    let form: EditScrapPageForm
}
