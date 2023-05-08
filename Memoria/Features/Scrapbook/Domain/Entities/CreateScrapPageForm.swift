//
//  CreateScrapPageForm.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation

struct CreateScrapPageForm: Equatable {
    let id: UUID
    let name: String
    let thumbnail: String
    let content: String
    let createdAt: Date
    let updatedAt: Date

    let scrapBook: ScrapBook
}
