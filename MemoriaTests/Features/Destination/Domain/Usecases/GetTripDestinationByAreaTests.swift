//
//  GetTripDestinationByAreaTests.swift
//  MemoriaTests
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import XCTest
import Combine
import Cuckoo
@testable import Memoria

final class GetTripDestinationByAreaTests: XCTestCase {
    
    var sut: GetTripDestinationByAreaImpl!
    var repository: MockDestinationRepository!
    var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        repository = MockDestinationRepository()
        cancellables = []
        sut = GetTripDestinationByAreaImpl(repository: repository)
    }

    override func tearDownWithError() throws {
        repository = nil
        cancellables = nil
        sut = nil
    }

    func test_Should_Return_List_Of_Destination_When_Succeed() throws {
        // Given
        let expectedDestination = [
            Destination(id: UUID(), area: Area(id: UUID(), name: "Jabodetabek"), name: "Ancol", description: "Lorem ipsum", photo: "ancol", address: "Jakarta Utara", coordinate: Coordinate(latitude: 1.000, longitude: 1.000), ticketPrice: "150000", webstite: nil, instagram: nil),
            Destination(id: UUID(), area: Area(id: UUID(), name: "Jabodetabek"), name: "Mall Pondok Indah", description: "Lorem ipsum", photo: "pim", address: "Jakarta Selaran", coordinate: Coordinate(latitude: 2.000, longitude: 2.000), ticketPrice: nil, webstite: nil, instagram: nil)
        ]
        
        stub(repository) { mock in
            when(mock.fetchDestination(area: any()))
                .thenReturn(Just(expectedDestination)
                    .setFailureType(to: Failure.self)
                    .eraseToAnyPublisher())
        }
        
        // When
        
        let result = sut.execute(params: GetTripDestinationByAreaParams(area: Area(id: UUID(), name: "Jabodetabek")))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished :
                    break
                case .failure(let failure):
                    XCTFail("Expected success Result, but got error \(failure)")
                }
            }, receiveValue: { destination in
                // Then
                XCTAssertEqual(destination, expectedDestination, "Result destination is not equal")
                XCTAssertEqual(destination.count, 2)
            })
        
        cancellables.insert(result)
        verify(repository, times(1)).fetchDestination(area: any())
        
    }
    
    func test_Should_Return_Failure_When_Failed() throws {
        // Given
        let expectedFailure = Failure.fetchDestinationFailure
        stub(repository) { mock in
            when(mock.fetchDestination(area: any())).thenReturn(Fail(error: Failure.fetchDestinationFailure).eraseToAnyPublisher())
            
        }
        
        // When
        let result = sut.execute(params: GetTripDestinationByAreaParams(area: Area(id: UUID(), name: "Jabodetabek")))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished :
                    XCTFail("Expected error Result, but got success")
                case .failure(let failure):
                    //Then
                    XCTAssertEqual(failure, expectedFailure, "Unexpected failure occured")
                }
            }, receiveValue: { destination in
                XCTFail("Expected error Result, but got Destinations \(destination)")
            })
        
        cancellables.insert(result)
        verify(repository, times(1)).fetchDestination(area: any())
    }
    

}
