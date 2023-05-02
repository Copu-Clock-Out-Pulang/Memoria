//
//  ScrapPageLocalDataSource.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation
import Combine
import CoreData

protocol ScrapPageLocalDataSource {

    // ini smua coredata model atau ScrapPage biasa?

    func createScrapPage(scrapBook: ScrapBookCoreDataModel, page: ScrapPageCoreDataModel) -> AnyPublisher<ScrapPageCoreDataModel, Failure>

    func getScrapPages() -> AnyPublisher<[ScrapPageCoreDataModel], Failure>

    func editScrapPage(scrapPage: ScrapPageCoreDataModel) -> AnyPublisher<ScrapPageCoreDataModel, Failure>

    // yg delete itu scrappage atau scrappagedatamodel?
    func deleteScrapPage(scrapPage: ScrapPageCoreDataModel) -> AnyPublisher<Void, Failure>
}

class ScrapPageLocalDataSourceImpl: ScrapPageLocalDataSource {

    let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func getScrapPages() -> AnyPublisher<[ScrapPageCoreDataModel], Failure> {
        let fetchRequest: NSFetchRequest<ScrapPageCoreDataModel> = ScrapPageCoreDataModel.fetchRequest()
        do {
            let result = try context.fetch(fetchRequest)
            return Just(result).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.getScrapPageFailure).eraseToAnyPublisher()
        }
    }

    func createScrapPage(scrapBook: ScrapBookCoreDataModel, page: ScrapPageCoreDataModel) -> AnyPublisher<ScrapPageCoreDataModel, Failure> {

        scrapBook.addToScrapPages(page)
        do {
            try context.save()
            return Just(page).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.createScrapPageFailure).eraseToAnyPublisher()
        }
    }

    func editScrapPage(scrapPage: ScrapPageCoreDataModel) -> AnyPublisher<ScrapPageCoreDataModel, Failure> {
        do {
            let fetchedPage = try context.existingObject(with: scrapPage.objectID) as! ScrapPageCoreDataModel

            fetchedPage.name = scrapPage.name
            fetchedPage.thumbnail = scrapPage.thumbnail
            fetchedPage.content = scrapPage.content
            fetchedPage.updatedAt = Date.now

            try context.save()
            return Just(fetchedPage).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.editScrapPageFailure).eraseToAnyPublisher()
        }
    }

    func deleteScrapPage(scrapPage: ScrapPageCoreDataModel) -> AnyPublisher<Void, Failure> {
        let fetchRequest = ScrapPageCoreDataModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "id", scrapPage.id! as any CVarArg)
        fetchRequest.fetchLimit = 1
        do {
            guard let scrapPage = try context.fetch(fetchRequest).first else {
                return Fail(error: Failure.deleteScrapPageFailure).eraseToAnyPublisher()
            }
            context.delete(scrapPage)
            return Just(()).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.deleteScrapPageFailure).eraseToAnyPublisher()
        }
    }
}
