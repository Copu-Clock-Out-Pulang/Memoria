//
//  ScrapPage.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation

struct ScrapPage: Equatable, Identifiable {
    let id: UUID
    let name: String
    let thumbnail: String
    let content: String
    let createdAt: Date
    let updatedAt: Date
}

extension ScrapPage {
    func with(
        id: UUID?? = nil,
        name: String?? = nil,
        thumbnail: String?? = nil,
        content: String?? = nil,
        createdAt: Date?? = nil,
        updatedAt: Date?? = nil
    ) -> ScrapPage {
        ScrapPage(
            id: (id ?? self.id)!,
            name: (name ?? self.name)!,
            thumbnail: (thumbnail ?? self.thumbnail)!,
            content: (content ?? self.content)!,
            createdAt: (createdAt ?? self.createdAt)!,
            updatedAt: (updatedAt ?? self.updatedAt)!
        )
    }
}
