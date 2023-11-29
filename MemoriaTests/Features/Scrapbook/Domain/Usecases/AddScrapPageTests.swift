//
//  AddScrapPageTests.swift
//  MemoriaTests
//
//  Created by Winxen Ryandiharvin on 28/04/23.
//

import XCTest
import Combine
import Cuckoo
@testable import Memoria

final class AddScrapPageTests: XCTestCase {

    var sut: AddScrapPageImpl!
    var repository: MockScrapPageRepository!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        repository = MockScrapPageRepository()
        cancellables = []
        sut = AddScrapPageImpl(repository: repository)
    }

    override func tearDownWithError() throws {
        repository = nil
        cancellables = nil
        sut = nil
    }

    func testShouldReturnScrapPageWhenSucceed() throws {
        let expectedScrapPage = ScrapPage(id: UUID(), name: "test", thumbnail: "asdf", content: "wasd", createdAt: Date.now, updatedAt: Date.now)
        
        stub(repository) { mock in
            when(mock.addScrapPage(scrapPage: any()))
                .thenReturn(Just(expectedScrapPage)
                    .setFailureType(to: Failure.self)
                    .eraseToAnyPublisher()
                )
        }
        
        sut.execute(params: AddScrapPageParams(
            name: "test",
            thumbnail: "asdf",
            content: "wasd"))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    XCTFail("Expected success result, but got error \(failure)")
                }
            }, receiveValue: { scrapPage in
                XCTAssertEqual(scrapPage, expectedScrapPage, "Result is not equal")
            }).store(in: &cancellables)
        verify(repository, times(1)).addScrapPage(scrapPage: any())
    }
    
    func testShouldReturnFailureWhenFailed() throws {
        let expectedFailure = Failure.addScrapPageFailure
        
        stub(repository) { mock in
            when(mock.addScrapPage(scrapPage: any()))
                .thenReturn(Fail(error: expectedFailure)
                .eraseToAnyPublisher()
            )
        }
        
        sut.execute(params: AddScrapPageParams(
            name: "test",
            thumbnail: "asdf",
            content: "wasd"))
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
        verify(repository, times(1)).addScrapPage(scrapPage: any())
    }

}
