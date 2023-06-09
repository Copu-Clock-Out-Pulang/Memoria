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
    //    func toModel() -> DestinationCoreDataModel {
    //        return DestinationCoreDataModel(
    //            id: (self.id ?? UUID())!,
    //            name: (self.name ?? "")!,
    //            photo: (self.photo ?? ""),
    //            address: (self.address ?? "")!,
    //            latitude: self.latitude,
    //            longitude: self.longitude,
    //            ticketPrice: self.ticketPrice,
    //            website: self.website,
    //            instagram: self.instagram, description: self.descriptions)
    //    }
    //
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

    static func fromDomain(destination: Destination) -> DestinationCoreDataModel {
        // set nilai
        var model = DestinationCoreDataModel()

        model.id = destination.id
        model.name = destination.name
        model.descriptions = destination.description
        model.photo = destination.photo
        model.address = destination.address
        model.latitude = destination.coordinate.latitude
        model.longitude = destination.coordinate.longitude
        model.ticketPrice = destination.ticketPrice
        model.website = destination.webstite
        model.instagram = destination.instagram

        return model
    }
}
