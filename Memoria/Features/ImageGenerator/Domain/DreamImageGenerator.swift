//
//  DreamImageGenerator.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 20/04/23.
//

import Foundation
import Combine

protocol DreamImageGenerator {
    func generateImageFrom(from: UIImage) -> AnyPublisher<UIImage, Failure>
}
