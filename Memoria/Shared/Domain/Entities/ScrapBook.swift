//
//  Scrapbook.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation

struct ScrapBook: Equatable, Identifiable {
    let id: UUID
    let user: User
    let destinations: [Destination]
    let scrapPages: [ScrapPage]
    let quote: String
    let name: String
    let date: Date
    let createdAt: Date
    let updatedAt: Date
    
}

extension ScrapBook {
    func with (
        id: UUID?? = nil,
        user: User?? = nil,
        destinations: [Destination]?? = nil,
        scrapPages: [ScrapPage]?? = nil,
        quote: String?? = nil,
        name: String?? = nil,
        date: Date?? = nil,
        createdAt: Date?? = nil,
        updatedAt: Date?? = nil
    ) -> ScrapBook {
        ScrapBook(
            id: (id ?? self.id)!,
            user: (user ?? self.user)!,
            destinations: (destinations ?? self.destinations)!,
            scrapPages: (scrapPages ?? self.scrapPages)!,
            quote: (quote ?? self.quote)!,
            name: (name ?? self.name)!,
            date: (date ?? self.date)!,
            createdAt: (createdAt ?? self.createdAt)!,
            updatedAt: (updatedAt ?? self.updatedAt)!
        )
    }
}
