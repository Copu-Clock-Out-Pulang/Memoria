//
//  Failure.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 21/04/23.
//

import Foundation

enum Failure: Error {
    case imageGenerationFailure
    
    
    // MARK: - ScrapPage Failures
    case addScrapPageFailure
    case editScrapPageFailure
    case deleteScrapPageFailure
}
