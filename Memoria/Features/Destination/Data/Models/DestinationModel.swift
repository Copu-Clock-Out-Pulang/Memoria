//
//  DestinationModels.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 24/04/23.
//

import Foundation

struct DestinationModel: Identifiable {
    let id: UUID
    let name: String
    let photo: String
    let address: String
    let latitude: Double
    let longitude: Double
    let ticketPrice: String?
    let website: String?
    let instagram: String?
}

extension DestinationCoreDataModel {
    func toModel() -> DestinationModel? {
        guard let id = self.id,
              let name = self.name,
              let photo = self.photo,
              let address = self.address,
              let latitude = self.latitude as? Double,
              let longitude = self.longitude as? Double
        else {
            return nil
        }
        return DestinationModel(
            id: id,
            name: name,
            photo: photo,
            address: address,
            latitude: latitude,
            longitude: longitude,
            ticketPrice: self.ticketPrice,
            website: self.website,
            instagram: self.instagram)
    }
}
