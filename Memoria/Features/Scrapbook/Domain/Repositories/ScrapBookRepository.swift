//
//  ScrapBookRepository.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 28/04/23.
//

import Foundation
import Combine

protocol ScrapBookRepository {
    func createScrapBook(form: CreateScrapBookForm) -> AnyPublisher<ScrapBook, Failure>
}
