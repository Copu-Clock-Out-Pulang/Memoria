//
//  DestinationImageGenerator.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 21/04/23.
//

import UIKit
import Combine
import CoreImage

protocol DestinationImageGenerator {
    /**
     Generate destination image from inputted family photo
     - Parameters:
     - from: TheFamily photo
     - to: The Destination Photo
     - Returns: A Destination image with family photo
     */
    func generateDestinationImage(from: UIImage, to: UIImage ) -> AnyPublisher<UIImage, Failure>
}

class DestinationImageGeneratorImpl: DestinationImageGenerator {

    // MARK: - Dependency
    private let imageSegmentor: ImageSegmentor

    // MARK: - Constructor
    init(imageSegmentor: ImageSegmentor) {
        self.imageSegmentor = imageSegmentor
    }

    // MARK: - Implementation
    func generateDestinationImage(from: UIImage, to: UIImage) -> AnyPublisher<UIImage, Failure> {
        let image = from.resized(to: CGSize(width: 512, height: 512))
        let background = to.resized(to: CGSize(width: 512, height: 512))

        return imageSegmentor.detectPerson(input: image)
            .tryMap { [weak self] personMask in
                guard let self = self else {
                    throw Failure.imageGenerationFailure
                }
                // resize background image


                // composite the person image
                guard let output = self.maskImage(input: image, background: background, mask: personMask) else {
                    throw Failure.imageGenerationFailure
                }

                return output


            }
            .mapError { error -> Failure in
                debugPrint(error)
                if let failure = error as? Failure {
                    return failure
                }
                return Failure.imageGenerationFailure

            }
            .eraseToAnyPublisher()
    }

    // MARK: - Private Functions

    private func maskImage(input: UIImage, background: UIImage, mask: UIImage) -> UIImage? {
        guard let inputRef = CIImage(image: input),
              let backgroundRef = CIImage(image: background),
              let maskRef = CIImage(image: mask) else {
            return nil
        }

        guard let filter = CIFilter(name: "CIBlendWithMask", parameters: [
            kCIInputImageKey: inputRef,
            kCIInputBackgroundImageKey: backgroundRef,
            kCIInputMaskImageKey: maskRef
        ]) else {
            return nil
        }

        guard let composite = filter.outputImage else {
            return nil
        }

        let context = CIContext(options: nil)
        guard let filteredImageRef = context.createCGImage(composite, from: composite.extent) else {
            return nil
        }

        return UIImage(cgImage: filteredImageRef)

    }


}
