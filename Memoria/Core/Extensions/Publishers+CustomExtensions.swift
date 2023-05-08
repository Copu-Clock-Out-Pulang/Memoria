//
//  Publishers+CustomExtensions.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import Combine

extension Publishers {
    static func zipMany<T>(_ publishers: [AnyPublisher<T, Failure>]) -> AnyPublisher<[T], Failure> {
        let initialPublisher = Empty<[T], Failure>().eraseToAnyPublisher()
        return publishers.reduce(into: initialPublisher) { result, publisher in
            result = result.zip(publisher).map { $0 + [$1] }.eraseToAnyPublisher()
        }
    }
}
