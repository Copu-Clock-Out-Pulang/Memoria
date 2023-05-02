//
//  ScrapPageCoreDataModel+CoreDataProperties.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//
//

import Foundation
import CoreData


extension ScrapPageCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScrapPageCoreDataModel> {
        return NSFetchRequest<ScrapPageCoreDataModel>(entityName: "ScrapPageCoreDataModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var content: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var scrapBook: ScrapBookCoreDataModel?

}

extension ScrapPageCoreDataModel : Identifiable {

}
