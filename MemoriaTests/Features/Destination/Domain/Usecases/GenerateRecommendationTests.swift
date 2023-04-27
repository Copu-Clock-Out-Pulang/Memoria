//
//  GenerateRecommendationTests.swift
//  MemoriaTests
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import XCTest
import Combine
import Cuckoo
@testable import Memoria

final class GenerateRecommendationTests: XCTestCase {

    var sut: GenerateRecommendationImpl!
    var generator: MockDestinationImageGenerator!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        generator = MockDestinationImageGenerator()
        cancellables = []
        sut = GenerateRecommendationImpl(generator: generator)
    }

    override func tearDownWithError() throws {
        generator = nil
        cancellables = nil
        sut = nil
    }
    
    func test_Should_Return_Recommendations_When_Succeed() {
           // Given
        let familyPhoto = I.imageTest.image
           let destinations = [
            Destination(id: UUID(), area: Area(id: UUID(), name: "Jabodetabek"), name: "Ancol", description: "Lorem ipsum", photo: "ancol", address: "Jakarta Utara", coordinate: Coordinate(latitude: 1.000, longitude: 1.000), ticketPrice: "150000", webstite: nil, instagram: nil),
            Destination(id: UUID(), area: Area(id: UUID(), name: "Jabodetabek"), name: "Mall Pondok Indah", description: "Lorem ipsum", photo: "pim", address: "Jakarta Selaran", coordinate: Coordinate(latitude: 2.000, longitude: 2.000), ticketPrice: nil, webstite: nil, instagram: nil)
           ]
           let expectedRecommendations = destinations.map { destination in
               let destinationPhoto = I.outputTest.image
               return Recommendation(id: UUID(), destination: destination, generatedPhoto: destinationPhoto)
           }
           stub(generator) { mock in
               for _ in destinations {
                   let destinationPhoto = I.outputTest.image
                   let generatedPhoto = destinationPhoto // in this test, we'll just return the destination photo as-is
                   when(mock.generateDestinationImage(from: equal(to: familyPhoto), to: equal(to: destinationPhoto))).thenReturn(Just(generatedPhoto).setFailureType(to: Failure.self).eraseToAnyPublisher())
               }
           }
           
           // When
           let params = GenerateRecommendationParams(destinations: destinations, familyPhoto: familyPhoto)
           let result = sut.execute(params: params)
               .sink(receiveCompletion: { completion in
                   switch completion {
                   case .finished:
                       break
                   case .failure(let error):
                       XCTFail("Expected successful result, but got error: \(error)")
                   }
               }, receiveValue: { recommendations in
                   // Then
                   XCTAssertEqual(recommendations.count, expectedRecommendations.count, "Unexpected number of recommendations received")
                   for (index, recommendation) in recommendations.enumerated() {
                       XCTAssertEqual(recommendation.id, expectedRecommendations[index].id, "Unexpected recommendation ID at index \(index)")
                       XCTAssertEqual(recommendation.destination, expectedRecommendations[index].destination, "Unexpected recommendation destination at index \(index)")
                       XCTAssertEqual(recommendation.generatedPhoto, expectedRecommendations[index].generatedPhoto, "Unexpected recommendation generated photo at index \(index)")
                   }
               })
           result.store(in: &cancellables)
       }
    
    

}
