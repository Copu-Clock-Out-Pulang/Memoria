//
//  Failure.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 21/04/23.
//

import Foundation

enum Failure: Error {
    // MARK: - Image Generation Failures
    case imageGenerationFailure

    // MARK: - Destination Failures
    case generateRecommendationFailure
    case fetchAreaFailure
    case fetchDestinationFailure

    // MARK: - ScrapBook Failures
    case createScrapBookFailure
}
