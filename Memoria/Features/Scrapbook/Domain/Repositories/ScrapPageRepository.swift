//
//  ScrapPageEditor.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 27/04/23.
//

import Foundation
import Combine

protocol ScrapPageRepository {

    func addScrapPage(scrapPage: ScrapPage) ->
    AnyPublisher<ScrapPage, Failure>

    func editScrapPage(scrapPage: ScrapPage) ->
    AnyPublisher<ScrapPage, Failure>

    func deleteScrapPage(scrapPage: ScrapPage) ->
    AnyPublisher<Void, Failure>

}
