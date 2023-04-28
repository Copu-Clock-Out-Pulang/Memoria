//
//  Recommendation.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation
import UIKit

struct Recommendation: Equatable, Identifiable {
    let id: UUID
    let destination: Destination
    let generatedPhoto: UIImage
}

extension Recommendation {

    func with(
        id: UUID?? = nil,
        destination: Destination?? = nil,
        generatedPhoto: UIImage?? = nil
    )
    -> Recommendation {
        Recommendation(
            id: (id ?? self.id)!,
            destination: (destination ?? self.destination)!,
            generatedPhoto: (generatedPhoto ?? self.generatedPhoto)!
        )
    }
}
