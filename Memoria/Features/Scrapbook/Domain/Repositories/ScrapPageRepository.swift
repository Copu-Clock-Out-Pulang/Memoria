//
//  ScrapPageEditor.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 27/04/23.
//

import Foundation
import Combine

protocol ScrapPageRepository {

    func createScrapPage(form: CreateScrapPageForm, page: ScrapPage) -> AnyPublisher <ScrapPage, Failure>

    func getScrapPages() -> AnyPublisher<[ScrapPage], Failure>

    func editScrapPage(scrapPage: ScrapPage, form: EditScrapPageForm) -> AnyPublisher <ScrapPage, Failure>

    func deleteScrapPage(scrapPage: ScrapPage) -> AnyPublisher<Void, Failure>
}
