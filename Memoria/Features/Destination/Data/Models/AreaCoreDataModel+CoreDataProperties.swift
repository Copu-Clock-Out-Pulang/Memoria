//
//  AreaCoreDataModel+CoreDataProperties.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 29/04/23.
//
//

import Foundation
import CoreData


extension AreaCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AreaCoreDataModel> {
        return NSFetchRequest<AreaCoreDataModel>(entityName: "AreaCoreDataModel")
    }

    @NSManaged public var descriptions: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var province: String?
    @NSManaged public var destinations: NSSet?

}

// MARK: Generated accessors for destinations
extension AreaCoreDataModel {

    @objc(addDestinationsObject:)
    @NSManaged public func addToDestinations(_ value: DestinationCoreDataModel)

    @objc(removeDestinationsObject:)
    @NSManaged public func removeFromDestinations(_ value: DestinationCoreDataModel)

    @objc(addDestinations:)
    @NSManaged public func addToDestinations(_ values: NSSet)

    @objc(removeDestinations:)
    @NSManaged public func removeFromDestinations(_ values: NSSet)

}

extension AreaCoreDataModel: Identifiable {

}

extension AreaCoreDataModel {
    func toDomain() -> Area {
        return Area(
            id: (self.id ?? UUID())!,
            name: (self.name ?? "")!,
            province: self.province!,
            description: self.descriptions!,
            image: self.image!
        )
    }
}
