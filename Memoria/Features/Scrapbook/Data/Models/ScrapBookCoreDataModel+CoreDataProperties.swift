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
    @NSManaged public var user: UserCoreDataModel?

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

extension ScrapBookCoreDataModel : Identifiable {

}
