//
//  File.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation

struct Coordinate: Equatable, Hashable, Identifiable {
    let id: UUID
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.id = UUID()
        self.latitude = latitude
        self.longitude = longitude
    }
}
