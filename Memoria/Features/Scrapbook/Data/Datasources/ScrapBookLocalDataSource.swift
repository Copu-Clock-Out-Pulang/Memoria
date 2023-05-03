//
//  ScrapBookLocalDataSource.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation
import Combine
import CoreData

protocol ScrapBookLocalDataSource {

    // func createScrapBook, bingung createscrapbook paramsnya apa
    func createScrapBook(scrapBook: ScrapBookCoreDataModel) -> AnyPublisher<ScrapBookCoreDataModel, Failure>

    func getScrapBooks() -> AnyPublisher<[ScrapBookCoreDataModel], Failure>

    func editScrapBook(scrapBook: ScrapBookCoreDataModel) -> AnyPublisher<ScrapBookCoreDataModel, Failure>

    func deleteScrapBook(scrapBook: ScrapBookCoreDataModel) -> AnyPublisher<Void, Failure>

}

class ScrapBookLocalDataSourceImpl: ScrapBookLocalDataSource {

    let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func createScrapBook(scrapBook: ScrapBookCoreDataModel) -> AnyPublisher<ScrapBookCoreDataModel, Failure> {
        do {
            try context.save()
            return Just(scrapBook).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.createScrapBookFailure).eraseToAnyPublisher()
        }
    }

    func editScrapBook(scrapBook: ScrapBookCoreDataModel) -> AnyPublisher<ScrapBookCoreDataModel, Failure> {
        do {
            let fetchedScrapBook = try context.existingObject(with: scrapBook.objectID) as! ScrapBookCoreDataModel

            fetchedScrapBook.name = scrapBook.name


            try context.save()
            return Just(fetchedScrapBook).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.editScrapBookFailure).eraseToAnyPublisher()
        }
    }

    func deleteScrapBook(scrapBook: ScrapBookCoreDataModel) -> AnyPublisher<Void, Failure> {
        do {
            context.delete(scrapBook)
            try context.save()
            return Just(()).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.deleteScrapBookFailure).eraseToAnyPublisher()
        }
    }

    func getScrapBooks() -> AnyPublisher<[ScrapBookCoreDataModel], Failure> {
        let fetchRequest: NSFetchRequest<ScrapBookCoreDataModel> = ScrapBookCoreDataModel.fetchRequest()
        do {
            let result = try context.fetch(fetchRequest)
            return Just(result).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.getScrapBookFailure).eraseToAnyPublisher()
        }
    }
}
