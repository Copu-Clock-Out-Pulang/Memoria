//
//  DeleteScrapPageTests.swift
//  MemoriaTests
//
//  Created by Winxen Ryandiharvin on 28/04/23.
//

import XCTest
import Combine
import Cuckoo
@testable import Memoria

final class DeleteScrapPageTests: XCTestCase {

    var sut: DeleteScrapPageImpl!
    var repository: MockScrapPageRepository!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        repository = MockScrapPageRepository()
        cancellables = []
        sut = DeleteScrapPageImpl(repository: repository)
    }

    override func tearDownWithError() throws {
        repository = nil
        cancellables = nil
        sut = nil
    }

    func testShouldReturnVoidWhenSucceed() throws {
    
        stub(repository) { mock in
            when(mock.deleteScrapPage(scrapPage: any()))
                .thenReturn(Just(())
                    .setFailureType(to: Failure.self)
                    .eraseToAnyPublisher()
                )
        }
        
        sut.execute(params: DeleteScrapPageParams(
            scrapPage: ScrapPage(id: UUID(), name: "gue", thumbnail: "oui", content: "zxcv", createdAt: Date.now, updatedAt: Date.now)))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    XCTFail("Expected success result, but got error \(failure)")
                }
            }, receiveValue: { scrapPage in
            }).store(in: &cancellables)
        verify(repository, times(1)).deleteScrapPage(scrapPage: any())
    }
    
    func testShouldReturnFailureWhenFailed() throws {
        let expectedFailure = Failure.deleteScrapPageFailure
        
        stub(repository) { mock in
            when(mock.deleteScrapPage(scrapPage: any()))
                .thenReturn(Fail(error: expectedFailure)
                .eraseToAnyPublisher()
            )
        }
        
        sut.execute(params: DeleteScrapPageParams(
            scrapPage: ScrapPage(id: UUID(), name: "gue", thumbnail: "oui", content: "zxcv", createdAt: Date.now, updatedAt: Date.now)))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("Expected fail result, but succeeded")
                case .failure(let failure):
                    XCTAssertEqual(failure, expectedFailure, "Unexpected failure occured")
                }
            }, receiveValue: { scrapPage in
                XCTFail("Expected failure")
            }).store(in: &cancellables)
        verify(repository, times(1)).deleteScrapPage(scrapPage: any())
    }

}
