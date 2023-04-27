//
//  DestinationImageGenerator.swift
//  MemoriaTests
//
//  Created by Adryan Eka Vandra on 24/04/23.
//

import XCTest
import Combine
import Cuckoo
@testable import Memoria

final class DestinationImageGeneratorTest: XCTestCase {

    var sut: DestinationImageGenerator!
    var cancellable: AnyCancellable!
    var mockSegmentor: MockImageSegmentor!
    override func setUp() {
        super.setUp()
        mockSegmentor = MockImageSegmentor()
        sut = DestinationImageGeneratorImpl(imageSegmentor: mockSegmentor)
        cancellable = nil
        
    }

    override func tearDown(){
        sut = nil
        cancellable = nil
        super.tearDown()
    }

    func testGenerateDestinationImage() {
        let image = I.yey.image
        let mask = I.mask.image
        let background = I.outputTest.image
        
        let expectation = self.expectation(description: "should generate image")
        
        // Arrange
        stub(self.mockSegmentor) { stub in
            stub.detectPerson(input: any()).then { _ in
                let resize =  mask.resized(to: CGSize(width: 513, height: 513), scale: 1)

                return Just(resize).setFailureType(to: Failure.self).eraseToAnyPublisher()
            }
        }
        
        // Act
        cancellable = sut.generateDestinationImage(from: image, to: background)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Expected success but got failure with error: \(error.localizedDescription)")

                }
            }, receiveValue: { result in
                XCTAssertNotNil(result)
//                                    guard let data = result.pngData() else {
//                                        debugPrint("Cannot convert output image to PNG data")
//                                        return
//                                        }
//                                    do {
//                                        let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                                        let fileURL = documentsDirectory.appendingPathComponent("output_image.png")
//                                        print(fileURL)
//                                        try data.write(to: fileURL)
//                                    } catch {
//                                        debugPrint("Cannot save output image: \(error)")
//                                    }
            })

        waitForExpectations(timeout: 5, handler: nil)
//        verify(self.mockSegmentor, times(1)).detectPerson(input: any())

    }

}
