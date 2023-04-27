//
//  Destination.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation

struct Destination: Equatable {
    let id: UUID
    let name: String
    let photo: String
    let address: String
    let coordinate: Coordinate
    let ticketPrice: String?
    let webstite: String?
    let instagram: String?
}
