//
//  User.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation

struct User: Equatable, Identifiable {
    let id: UUID
    let name: String
}


extension User {
    func with(
        id: UUID?? = nil,
        name: String?? = nil
    ) -> User {
        User(
            id: (id ?? self.id)!,
            name: (name ?? self.name)!
        )
    }
}
