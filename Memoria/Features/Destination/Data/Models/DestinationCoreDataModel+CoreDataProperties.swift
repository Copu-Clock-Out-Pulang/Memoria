//
//  DestinationCoreDataModel+CoreDataProperties.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//
//

import Foundation
import CoreData


extension DestinationCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DestinationCoreDataModel> {
        return NSFetchRequest<DestinationCoreDataModel>(entityName: "DestinationCoreDataModel")
    }

    @NSManaged public var address: String?
    @NSManaged public var id: UUID?
    @NSManaged public var instagram: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    @NSManaged public var photo: String?
    @NSManaged public var ticketPrice: String?
    @NSManaged public var website: String?

}

extension DestinationCoreDataModel : Identifiable {

}
