//
//  ScrapBookDataSource.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation
import Combine

protocol ScrapBookDataSource {
    func getScrapBook() -> AnyPublisher<[ScrapBookCoreDataModel], Failure>
}

class ScrapBookDataSourceImpl: ScrapBookDataSource {
    
    func getScrapBook() -> AnyPublisher<[ScrapBookCoreDataModel], Failure> {
    }
}
