//
//  CreateScrapbookForm.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation

struct CreateScrapBookForm: Equatable {
    let tripName: String
    let quote: String
    let selectedRecommendations: [Recommendation]
    let startDate: Date?
    let endDate: Date?
}
