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
    func getScrapPages() -> AnyPublisher<[ScrapPageCoreDataModel], Error>
}

class ScrapPageSourceImpl: ScrapPageLocalDataSource {
    let persistentController: PersistenceController
    
    init(persistentController: PersistenceController) {
        self.persistentController = persistentController
    }
    
    func getScrapPages() -> AnyPublisher<[ScrapPageCoreDataModel], Error> {
        let fetchRequest: NSFetchRequest<ScrapPageCoreDataModel> = ScrapPageCoreDataModel.fetchRequest()
        do {
            let context = persistentController.container.viewContext
            let result = try context.fetch(fetchRequest)
            return Just(result).setFailureType(to: Error.self).eraseToAnyPublisher()
        } catch let error {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
