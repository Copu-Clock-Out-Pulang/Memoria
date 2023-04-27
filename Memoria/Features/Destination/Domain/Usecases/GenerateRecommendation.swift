//
//  GenerateRecommendation.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation
import UIKit
import Combine
protocol GenerateRecommendation: UseCaseProtocol {
    associatedtype ReturnType = [Recommendation]
    associatedtype Params = GenerateRecommendationParams
}

class GenerateRecommendationImpl: GenerateRecommendation {
    
    private let generator: DestinationImageGenerator
    
    init(generator: DestinationImageGenerator) {
        self.generator = generator
    }
    
    func execute(params: GenerateRecommendationParams) -> AnyPublisher<[Recommendation], Failure> {
        
        let destinationPublishers = params.destinations.map { destination in
            let destinationPhoto = UIImage(named: destination.photo) ?? I.outputTest.image
            return generator.generateDestinationImage(from: params.familyPhoto, to: destinationPhoto)
                .map { Recommendation(id: UUID(), destination: destination, generatedPhoto: $0) }
                .catch { _ in
                    Fail(error: Failure.imageGenerationFailure)
                }
                .eraseToAnyPublisher()
        }
        return Publishers.zipMany(destinationPublishers)
            .eraseToAnyPublisher()
        
    }
    
}

struct GenerateRecommendationParams: Equatable {
    let destinations: [Destination]
    let familyPhoto: UIImage
}
