//
//  Area.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation

struct Area: Equatable, Identifiable {
    let id: UUID
    let name: String
    
}

extension Area {
    func with(
        id: UUID?? = nil,
        name: String?? = nil
    ) -> Area {
        Area(
            id: (id ?? self.id)!,
            name: (name ?? self.name)!
        )
    }
}
