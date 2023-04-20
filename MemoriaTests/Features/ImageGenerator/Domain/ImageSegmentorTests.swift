//
//  ImageSegmentorTests.swift
//  MemoriaTests
//
//  Created by Adryan Eka Vandra on 20/04/23.
//

import XCTest
import Combine
@testable import Memoria

final class ImageSegmentorTests: XCTestCase {

    var sut: ImageSegmentorImpl!
        var cancellable: AnyCancellable!

        override func setUp() {
            super.setUp()
            sut = ImageSegmentorImpl()
            cancellable = nil
        }

        override func tearDown() {
            sut = nil
            cancellable = nil
            super.tearDown()
        }

        func testDetectPersonReturnsSuccess() {
            // given
            let image = I.imageTest.image
            let expectation = self.expectation(description: "Should succeed")

            // when
            cancellable = sut.detectPerson(input: image)
                .sink(receiveCompletion: { result in
                    switch result {
                    case .finished:
                        expectation.fulfill()
                    case .failure(let error):
                        XCTFail("Expected success but got failure with error: \(error.localizedDescription)")
                    }
                }, receiveValue: { output in
                    // then
                    XCTAssertNotNil(output)
                    XCTAssertTrue(output.size.equalTo(image.size))
//                    guard let data = output.pngData() else {
//                        debugPrint("Cannot convert output image to PNG data")
//                        return
//                        }
//                    do {
//                        let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                        let fileURL = documentsDirectory.appendingPathComponent("output_image.png")
//                        print(fileURL)
//                        try data.write(to: fileURL)
//                    } catch {
//                        debugPrint("Cannot save output image: \(error)")
//                    }
            })

            // then
            waitForExpectations(timeout: 10, handler: nil)
        }

        func testDetectPersonReturnsFailure() {
            // given
            let image: UIImage? = nil
            let expectation = self.expectation(description: "Should fail")

            // when
            cancellable = sut.detectPerson(input: image)
                .sink(receiveCompletion: { result in
                    switch result {
                    case .finished:
                        XCTFail("Expected failure but got success")
                    case .failure(let error):
                        XCTAssertEqual(error, .imageGenerationFailure)
                        expectation.fulfill()
                    }
                }, receiveValue: { output in
                    XCTFail("Expected failure but got success with output: \(output)")
                })

            // then
            waitForExpectations(timeout: 10, handler: nil)
        }
}
