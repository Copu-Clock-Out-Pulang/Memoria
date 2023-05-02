//
//  DestinationCoreDataModel+CoreDataProperties.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 29/04/23.
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
    @NSManaged public var descriptions: String?
    @NSManaged public var area: AreaCoreDataModel?

}

extension DestinationCoreDataModel: Identifiable {

}


extension DestinationCoreDataModel {
    func toModel() -> DestinationModel {
        return DestinationModel(
            id: (self.id ?? UUID())!,
            name: (self.name ?? "")!,
            description: (self.descriptions ?? "")!,
            photo: (self.photo ?? ""),
            address: (self.address ?? "")!,
            latitude: self.latitude,
            longitude: self.longitude,
            ticketPrice: self.ticketPrice,
            website: self.website,
            instagram: self.instagram)
    }
    
    func toDomain() -> Destination {
        return Destination(
            id: (self.id ?? UUID())!,
            area: self.area!.toDomain(),
            name: (self.name ?? "")!,
            description: (self.descriptions ?? ""),
            photo: (self.photo ?? ""),
            address: (self.address ?? ""),
            coordinate: Coordinate(latitude: self.latitude, longitude: self.longitude),
            ticketPrice: self.ticketPrice,
            webstite: self.website,
            instagram: self.instagram)
    }
}
