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

    func createScrapPage(form: CreateScrapPageForm) -> AnyPublisher<ScrapPageCoreDataModel, Failure>

    func getScrapPages() -> AnyPublisher<[ScrapPageCoreDataModel], Failure>

    func editScrapPage(scrapPage: ScrapPage, form: EditScrapPageForm) -> AnyPublisher<ScrapPageCoreDataModel, Failure>

    func deleteScrapPage(scrapPage: ScrapPage) -> AnyPublisher<Void, Failure>
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

    func createScrapPage(form: CreateScrapPageForm) -> AnyPublisher<ScrapPageCoreDataModel, Failure> {

        let scrapBook = ScrapPageCoreDataModel.fromDomain(form: form, context: context)
        //        scrapBook.addToScrapPages(scrap)
        do {
            try context.save()
            return Just(scrapBook).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.createScrapPageFailure).eraseToAnyPublisher()
        }
    }

    func editScrapPage(scrapPage: ScrapPage, form: EditScrapPageForm) -> AnyPublisher<ScrapPageCoreDataModel, Failure> {
        let request = ScrapPageCoreDataModel.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", scrapPage.id as CVarArg)
        request.fetchLimit = 1
        do {
            guard let fetchedPage = try context.fetch(request).first else {
                return Fail(error: Failure.editScrapPageFailure).eraseToAnyPublisher()
            }
            fetchedPage.name = form.name
            fetchedPage.thumbnail = form.thumbnail
            fetchedPage.content = form.content
            fetchedPage.updatedAt = Date.now

            try context.save()
            return Just(fetchedPage).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.editScrapPageFailure).eraseToAnyPublisher()
        }
    }

    func deleteScrapPage(scrapPage: ScrapPage) -> AnyPublisher<Void, Failure> {
        let fetchRequest = ScrapPageCoreDataModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "id", scrapPage.id as any CVarArg)
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
