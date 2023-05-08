//
//  GetTripAreaTest.swift
//  MemoriaTests
//
//  Created by Adryan Eka Vandra on 27/04/23.
//

import XCTest
import Combine
import Cuckoo
@testable import Memoria


class GetTripAreaTests: XCTestCase {
    
    var repository: MockDestinationRepository!
    var cancellables: Set<AnyCancellable>!
    var sut: GetTripAreaImpl!
    
    override func setUpWithError() throws {
        repository = MockDestinationRepository()
        cancellables = []
        sut = GetTripAreaImpl(repository: repository)
    }
    

    override func tearDownWithError() throws {
        repository = nil
        cancellables = nil
        sut = nil
    }
    

    func test_Should_Return_Area_When_Succeed() throws {
        // Given
        let expectedAreas = [Area(id: UUID(), name: "Area 1", province: "Jakarta", description: "desc", image: "image"), Area(id: UUID(), name: "Area 2", province: "Jakarta", description: "desc", image: "image")]
        stub(repository){ mock in
            when(mock.fetchArea()).thenReturn(Just(expectedAreas).setFailureType(to: Failure.self).eraseToAnyPublisher())
        }
            
        // When
        let result = sut.execute(params: NoParams())
            .sink(receiveCompletion: { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTFail("Expected successful result, but got error: \(error)")
                    }
                },
                  receiveValue: { areas in
                    // Then
                    XCTAssertEqual(areas, expectedAreas, "Unexpected areas received")
            })
        
        
        cancellables.insert(result)
        verify(repository, times(1)).fetchArea()
    }
    
    func test_Should_Return_Failure_When_Failed() throws {
        // Given
        let expectedFailure = Failure.fetchAreaFailure
        stub(repository) { mock in
            when(mock.fetchArea()).thenReturn(Fail(error: expectedFailure).eraseToAnyPublisher())
            
        }
        
        // When
        let result = sut.execute(params: NoParams())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("Expected error, but got successful result")
                case .failure(let failure):
                    XCTAssertEqual(failure, expectedFailure, "Unexpected error received")

                }
            }, receiveValue: { areas in
                XCTFail("Expected error, but got areas: \(areas)")

            })
        cancellables.insert(result)
        verify(repository, times(1)).fetchArea()
        
    }
    
    

}
