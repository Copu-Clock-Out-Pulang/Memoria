//
//  DestinationLocalDataSource.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 29/04/23.
//

import Foundation
import Combine
import CoreData

protocol DestinationLocalDataSource {
    func fetchArea() -> AnyPublisher<[AreaCoreDataModel], Failure>
    func fetchDestinationByArea(id: UUID) -> AnyPublisher<[DestinationCoreDataModel], Failure>
}

class DestinationLocalDataSourceImpl: DestinationLocalDataSource {

    let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
    func fetchArea() -> AnyPublisher<[AreaCoreDataModel], Failure> {
        let fetchReqest = AreaCoreDataModel.fetchRequest()
        do {
            let areas = try context.fetch(fetchReqest)
            return Just(areas).setFailureType(to: Failure.self).eraseToAnyPublisher()
        } catch _ {
            return Fail(error: Failure.fetchAreaFailure).eraseToAnyPublisher()
        }
    }

    func fetchDestinationByArea(id: UUID) -> AnyPublisher<[DestinationCoreDataModel], Failure> {
        let fetchRequest = AreaCoreDataModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "id", id as CVarArg)
        fetchRequest.fetchLimit = 1

        do {
            guard let areas = try context.fetch(fetchRequest).first else {
                return Fail(error: Failure.fetchDestinationFailure).eraseToAnyPublisher()

            }

            return Just(areas.destinations!.toArray())
                .setFailureType(to: Failure.self)
                .eraseToAnyPublisher()

        } catch _ {
            return Fail(error: Failure.fetchDestinationFailure).eraseToAnyPublisher()
        }
    }


}
