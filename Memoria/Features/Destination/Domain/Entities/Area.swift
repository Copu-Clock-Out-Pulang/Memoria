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
    let province: String
    let description: String
    let image: String

}

extension Area {
    func with(
        id: UUID?? = nil,
        name: String?? = nil,
        province: String?? = nil,
        description: String?? = nil,
        image: String?? = nil
    ) -> Area {
        Area(
            id: (id ?? self.id)!,
            name: (name ?? self.name)!,
            province: (province ?? self.province)!,
            description: (description ?? self.description)!,
            image: (image ?? self.image)!
        )
    }
}
