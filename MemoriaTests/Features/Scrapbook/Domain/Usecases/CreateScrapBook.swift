//
//  CreateScrapBook.swift
//  MemoriaTests
//
//  Created by Adryan Eka Vandra on 28/04/23.
//

import XCTest
import Combine
import Cuckoo
import UIKit
@testable import Memoria

final class CreateScrapBook: XCTestCase {

    var sut: CreateScrapBookImpl!
    var repository: MockScrapBookRepository!
    var cancellables: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        repository = MockScrapBookRepository()
        cancellables = []
        sut = CreateScrapBookImpl(repository: repository)
    }
    
    override func tearDownWithError() throws {
        repository = nil
        cancellables = nil
        sut = nil
    }
    
    
    lazy var params = {
        CreateScrapBookParams(form: CreateScrapBookForm(tripName: "Yey", quote: "quote", selectedRecommendations: [Recommendation(id: UUID(), destination: Destination(id: UUID(), area: Area(id: UUID(), name: "Jabodetabek", province: "Jakarta", description: "desc", image: "image"), name: "Ancol", description: "Lorem ipsum", photo: "ancol", address: "Jakarta Utara", coordinate: Coordinate(latitude: 1.000, longitude: 1.000), ticketPrice: "150000", webstite: nil, instagram: nil), generatedPhoto: UIImage())], startDate: Date.now, endDate: Date.now))
    }()
    
    func test_Create_ScrapBook_Should_Return_ScrapBook_When_Succeed() throws {
        let expectedScrapbook = ScrapBook(id: UUID(), user: User(
            id: UUID(),
            name: "Journey"), destinations: [
            Destination(id: UUID(), area: Area(id: UUID(), name: "Jabodetabek", province: "Jakarta", description: "desc", image: "image"), name: "Ancol", description: "Lorem ipsum", photo: "ancol", address: "Jakarta Utara", coordinate: Coordinate(latitude: 1.000, longitude: 1.000), ticketPrice: "150000", webstite: nil, instagram: nil),
            Destination(id: UUID(), area: Area(id: UUID(), name: "Jabodetabek", province: "Jakarta", description: "desc", image: "image"), name: "Mall Pondok Indah", description: "Lorem ipsum", photo: "pim", address: "Jakarta Selaran", coordinate: Coordinate(latitude: 2.000, longitude: 2.000), ticketPrice: nil, webstite: nil, instagram: nil)], scrapPages: [ScrapPage(id: UUID(), name: "Ancol", thumbnail: "thumbnail", content: "{}", createdAt: Date.now, updatedAt: Date.now)], quote: "Journey accross", name: "Journey la", startDate: Date.now, endDate: Date.now, createdAt: Date.now, updatedAt: Date.now)
        
        stub(repository) { mock in
            when(mock.createScrapBook(form: any()))
                .thenReturn(Just(expectedScrapbook).setFailureType(to: Failure.self).eraseToAnyPublisher())
            
        }
        
        sut.execute(params: params)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let failure):
                XCTFail("Expected success, failure found \(failure)")
            
            }
        }, receiveValue: {scrapbook in
            XCTAssertEqual(scrapbook, expectedScrapbook, "Scrapbook not equals")
        })
        .store(in: &cancellables)
        
        verify(repository, times(1)).createScrapBook(form: any())
            
    }
    
    func test_Create_ScrapBook_Should_Return_Failure_When_Failed() throws {
        let expectedFailure = Failure.createScrapBookFailure
        
        stub(repository) { mock in
            when(mock.createScrapBook(form: any()))
                .thenReturn(Fail(error: Failure.createScrapBookFailure).eraseToAnyPublisher())
            
        }
        
        sut.execute(params: params)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("expected error, got success")
                case.failure(let failure):
                    XCTAssertEqual(failure, expectedFailure, "got an unexpectedFailure")
                
                }
            }, receiveValue: {scrapPage in
                XCTFail("expected error, got success")

            })
            .store(in: &cancellables)
        
        verify(repository, times(1)).createScrapBook(form: any())

    }

}
