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
    func createScrapBook(scrapBook: CreateScrapBookForm, destinations: [DestinationCoreDataModel]) -> AnyPublisher<ScrapBookCoreDataModel, Failure>

    func getScrapBooks() -> AnyPublisher<[ScrapBookCoreDataModel], Failure>

    func editScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) -> AnyPublisher<ScrapBookCoreDataModel, Failure>

    func deleteScrapBook(scrapBook: ScrapBook) -> AnyPublisher<Void, Failure>

}

class ScrapBookLocalDataSourceImpl: ScrapBookLocalDataSource {

    let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func createScrapBook(scrapBook: CreateScrapBookForm, destinations: [DestinationCoreDataModel]) -> AnyPublisher<ScrapBookCoreDataModel, Failure> {
        let obj = ScrapBookCoreDataModel.fromDomain(form: scrapBook, destinations: destinations, context: context)
        do {
            try context.save()
            return Just(obj).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.createScrapBookFailure).eraseToAnyPublisher()
        }
    }

    func editScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) -> AnyPublisher<ScrapBookCoreDataModel, Failure> {
        let fetchRequest = ScrapBookCoreDataModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", scrapBook.id as CVarArg)
        fetchRequest.fetchLimit = 1
        do {
            guard let fetchedScrapBook = try context.fetch(fetchRequest).first else {
                return Fail(error: Failure.editScrapBookFailure).eraseToAnyPublisher()
            }
            fetchedScrapBook.name = form.name
            fetchedScrapBook.quote = form.quote
            fetchedScrapBook.startDate = form.startDate
            fetchedScrapBook.endDate = form.endDate
            fetchedScrapBook.updatedAt = Date.now

            try context.save()
            return Just(fetchedScrapBook).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.editScrapBookFailure).eraseToAnyPublisher()
        }
    }

    func deleteScrapBook(scrapBook: ScrapBook) -> AnyPublisher<Void, Failure> {
        let fetchRequest = ScrapBookCoreDataModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", scrapBook.id as CVarArg)
        fetchRequest.fetchLimit = 1
        do {
            guard let fetchedScrapBook = try context.fetch(fetchRequest).first else {
                return Fail(error: Failure.editScrapBookFailure).eraseToAnyPublisher()
            }
            context.delete(fetchedScrapBook)
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
