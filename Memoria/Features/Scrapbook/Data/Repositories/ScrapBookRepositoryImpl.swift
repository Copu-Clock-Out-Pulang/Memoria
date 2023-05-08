//
//  ScrapBookRepositoryImpl.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation
import Combine

class ScrapBookRepositoryImpl: ScrapBookRepository {

    let localDataSource: ScrapBookLocalDataSource
    let destinationLocalDataSource: DestinationLocalDataSource

    init(localDataSource: ScrapBookLocalDataSource, destinationLocalDataSource: DestinationLocalDataSource) {
        self.localDataSource = localDataSource
        self.destinationLocalDataSource = destinationLocalDataSource
    }

    func createScrapBook(form: CreateScrapBookForm) -> AnyPublisher<ScrapBook, Failure> {
        
        let destinationPublisher = form.selectedRecommendations.map { recommendation in
            return destinationLocalDataSource.fetchDestinationById(id: recommendation.destination.id)
                
        }
       return Publishers.MergeMany(destinationPublisher)
            .collect()
            .eraseToAnyPublisher()
            .flatMap { destinationCoreData in
                return self.localDataSource.createScrapBook(scrapBook: form, destinations: destinationCoreData)

            }
            .map {
                $0.toDomain()
            }
            .eraseToAnyPublisher()
          
//        localDataSource.createScrapBook(scrapBook: form).map { $0.toDomain() }.eraseToAnyPublisher()
    }

    func getScrapBooks() -> AnyPublisher<[ScrapBook], Failure> {
        return localDataSource.getScrapBooks()
            .map {
                $0.map {
                    $0.toDomain()
                }
            }
            .eraseToAnyPublisher()
    }
    func editScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) -> AnyPublisher<ScrapBook, Failure> {
        return localDataSource.editScrapBook(scrapBook: scrapBook, form: form).map { $0.toDomain() }.eraseToAnyPublisher()
    }

    func deleteScrapBook(scrapBook: ScrapBook) -> AnyPublisher<(), Failure> {
        return localDataSource.deleteScrapBook(scrapBook: scrapBook).eraseToAnyPublisher()
    }

}
