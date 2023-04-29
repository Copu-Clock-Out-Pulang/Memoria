//
//  DeleteScrapPage.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 27/04/23.
//

import Foundation
import Combine

protocol DeleteScrapPage: UseCaseProtocol {
    associatedtype ReturnType = Void
    associatedtype Params = DeleteScrapPageParams
}

class DeleteScrapPageImpl: DeleteScrapPage {

    let repository: ScrapPageRepository

    init(repository: ScrapPageRepository) {
        self.repository = repository
    }

    func execute(params: DeleteScrapPageParams) -> AnyPublisher<(), Failure> {
        repository.deleteScrapPage(scrapPage: params.scrapPage)
    }
}

struct DeleteScrapPageParams: Equatable {
    let scrapPage: ScrapPage
}
