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
    let description: String
    let photo: String
    let address: String
    let latitude: Double
    let longitude: Double
    let ticketPrice: String?
    let website: String?
    let instagram: String?
}
