//
//  File.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Foundation
import Combine

protocol DestinationRepository {
    func fetchArea() -> AnyPublisher<[Area], Failure>
    func fetchDestination(area: Area) -> AnyPublisher <[Destination], Failure>
}
