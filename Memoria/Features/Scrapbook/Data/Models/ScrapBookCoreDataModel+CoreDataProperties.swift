//
//  ScrapBookCoreDataModel+CoreDataProperties.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//
//

import Foundation
import CoreData


extension ScrapBookCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScrapBookCoreDataModel> {
        return NSFetchRequest<ScrapBookCoreDataModel>(entityName: "ScrapBookCoreDataModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var quote: String?
    @NSManaged public var name: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var createdAt: Date?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var scrapPages: NSSet?
    @NSManaged public var destinations: NSSet?

}

// MARK: Generated accessors for scrapPages
extension ScrapBookCoreDataModel {

    @objc(addScrapPagesObject:)
    @NSManaged public func addToScrapPages(_ value: ScrapPageCoreDataModel)

    @objc(removeScrapPagesObject:)
    @NSManaged public func removeFromScrapPages(_ value: ScrapPageCoreDataModel)

    @objc(addScrapPages:)
    @NSManaged public func addToScrapPages(_ values: NSSet)

    @objc(removeScrapPages:)
    @NSManaged public func removeFromScrapPages(_ values: NSSet)

}

// MARK: Generated accessors for destinations
extension ScrapBookCoreDataModel {

    @objc(addDestinationsObject:)
    @NSManaged public func addToDestinations(_ value: DestinationCoreDataModel)

    @objc(removeDestinationsObject:)
    @NSManaged public func removeFromDestinations(_ value: DestinationCoreDataModel)

    @objc(addDestinations:)
    @NSManaged public func addToDestinations(_ values: NSSet)

    @objc(removeDestinations:)
    @NSManaged public func removeFromDestinations(_ values: NSSet)

}

extension ScrapBookCoreDataModel: Identifiable {

}

extension ScrapBookCoreDataModel {
    func toDomain() -> ScrapBook {
        return ScrapBook(
            id: self.id!,
            destinations: (self.destinations!.allObjects as! [DestinationCoreDataModel]).map { $0.toDomain() },
            scrapPages: (self.scrapPages!.allObjects as! [ScrapPageCoreDataModel]).map { $0.toDomain() },
            quote: self.quote!,
            name: self.name!,
            startDate: self.startDate,
            endDate: self.endDate,
            createdAt: self.createdAt!,
            updatedAt: self.updatedAt!
        )
    }

    static func fromDomain(form: CreateScrapBookForm, destinations: [DestinationCoreDataModel], context: NSManagedObjectContext) -> ScrapBookCoreDataModel {
        var model = NSEntityDescription.insertNewObject(forEntityName: "ScrapBookCoreDataModel", into: context) as! ScrapBookCoreDataModel
        //        let user = UserCoreDataModel()
        //        user.id = UUID()
        //        user.name = "test"
        //        var model = ScrapBookCoreDataModel()
        model.id = UUID()
        //        model.user = user
        model.name = form.name
        model.destinations = NSSet(array: destinations)
        model.scrapPages = NSSet(array: form.scrapPages.map {
            ScrapPageCoreDataModel.fromDomain(scrapPage: $0, context: context)
        })
        model.quote = form.quote
        model.startDate = form.startDate
        model.endDate = form.endDate
        model.createdAt = Date.now
        model.updatedAt = Date.now

        return model
    }

    static func fromDomain(editForm: EditScrapBookForm, scrapBook: ScrapBook, context: NSManagedObjectContext) -> ScrapBookCoreDataModel {
        var model = ScrapBookCoreDataModel()

        model.id = scrapBook.id
        model.name = editForm.name
        model.scrapPages = NSSet(array: scrapBook.scrapPages.map {
            ScrapPageCoreDataModel.fromDomain(scrapPage: $0, context: context)
        })
        model.quote = editForm.quote
        model.startDate = editForm.startDate
        model.endDate = editForm.endDate
        model.updatedAt = Date.now

        return model
    }
    static func fromDomain(scrapBook: ScrapBook, context: NSManagedObjectContext) -> ScrapBookCoreDataModel {
        var model = ScrapBookCoreDataModel()

        model.id = scrapBook.id
        model.name = scrapBook.name
        model.quote = scrapBook.quote
        model.destinations = NSSet(array: scrapBook.destinations.map {
            DestinationCoreDataModel.fromDomain(destination: $0)
        })
        model.scrapPages = NSSet(array: scrapBook.scrapPages.map {
            ScrapPageCoreDataModel.fromDomain(scrapPage: $0, context: context)
        })
        model.startDate = scrapBook.startDate
        model.endDate = scrapBook.endDate
        model.createdAt = scrapBook.createdAt
        model.updatedAt = scrapBook.updatedAt

        return model

    }
}
