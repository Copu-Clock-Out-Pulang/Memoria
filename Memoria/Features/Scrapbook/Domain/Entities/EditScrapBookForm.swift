//
//  EditScrapBookForm.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 29/04/23.
//

import Foundation

struct EditScrapBookForm: Equatable {
    let name: String
    let scrapPage: [ScrapPage]
    let quote: String
    let startDate: Date?
    let endDate: Date?
}
