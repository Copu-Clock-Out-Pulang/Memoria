//
//  Destination.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation

struct Destination: Equatable, Identifiable {
    let id: UUID
    let area: Area
    let name: String
    let description: String
    let photo: String
    let address: String
    let coordinate: Coordinate
    let ticketPrice: String?
    let webstite: String?
    let instagram: String?
}

extension Destination {
    func with(
        id: UUID?? = nil,
        area: Area?? = nil,
        name: String?? = nil,
        description: String?? = nil,
        photo: String?? = nil,
        address: String?? = nil,
        coordinate: Coordinate?? = nil,
        ticketPrice: String?? = nil,
        website: String?? = nil,
        instagram: String?? = nil
    ) -> Destination {
        Destination(
            id: (id ?? self.id)!,
            area: (area ?? self.area)!,
            name: (name ?? self.name)!,
            description: (description ?? self.description)!,
            photo: (photo ?? self.photo)!,
            address: (address ?? self.address)!,
            coordinate: (coordinate ?? self.coordinate)!,
            ticketPrice: (ticketPrice ?? self.ticketPrice)!,
            webstite: (website ?? self.webstite)!,
            instagram: (instagram ?? self.instagram)!
        )
    }
}
