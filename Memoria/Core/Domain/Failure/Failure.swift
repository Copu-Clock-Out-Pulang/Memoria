//
//  Failure.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 21/04/23.
//

import Foundation

enum Failure: Error {
    // MARK: - Image Generation
    case imageGenerationFailure
    
    // MARK: - Destination Failure
    case generateRecommendationFailure
    case fetchAreaFailure
    case fetchDestinationFailure
}
