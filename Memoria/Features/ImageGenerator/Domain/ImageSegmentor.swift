//
//  ImageSegmentor.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 19/04/23.
//

import CoreImage
import UIKit
import Vision
import Combine

protocol ImageSegmentor {
    func detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure>
}

class ImageSegmentorImpl: ImageSegmentor {

    func detectPerson(input: UIImage?) -> AnyPublisher<UIImage, Failure> {
        
        return Future {[weak self] promise in
            guard let self = self else {
                debugPrint("self not found")
                promise(.failure(Failure.imageGenerationFailure))
                return
            }
            
            guard let image = input else {
                debugPrint("input is Empty")
                promise(.failure(Failure.imageGenerationFailure))
                return
            
            }
            guard let model = self.getMLModel() else {
                debugPrint("cannot get ML Model")
                promise(.failure(Failure.imageGenerationFailure))
                return
            }

            guard let vnCoreMLModel = try? VNCoreMLModel(for: model) else {
                debugPrint("cannot create ml model")
                promise(.failure(Failure.imageGenerationFailure))
                return
            }

            guard let request = self.createRequest(model: vnCoreMLModel) else {
                debugPrint("cannot create ml request")
                promise(.failure(Failure.imageGenerationFailure))
                return
            }
            guard let cgImage = image.cgImage else {
                debugPrint("Cannot convert to CIImage")
                promise(.failure(Failure.imageGenerationFailure))
                return
            }

            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try handler.perform([request])
            } catch {
                debugPrint(error)
                promise(.failure(Failure.imageGenerationFailure))
                return
            }

            // Extract the segmentation mask from the request's results
            guard let observation = request.results as? [VNCoreMLFeatureValueObservation] else {
                debugPrint("cannot create segmentation mask")
                promise(.failure(Failure.imageGenerationFailure))
                return
            }

            let segmentationMap = observation.first?.featureValue.multiArrayValue
            let segmentationMask = segmentationMap?.image(min: 0, max: 1)
            guard let outputMask = segmentationMask?.resizedImage(for: image.size) else {
                debugPrint("cannot create output mask")
                promise(.failure(Failure.imageGenerationFailure))
                return
            }

            DispatchQueue.main.async {
                promise(.success(outputMask))
            }
        }
        .eraseToAnyPublisher()


    }

    private func createRequest(model: VNCoreMLModel) -> VNCoreMLRequest? {
        let request = VNCoreMLRequest(model: model) { _, error in
            // Handle any errors that occur during the request
            if let error = error {
                print("Error performing Core ML request: \(error)")
                return
            }
        }

        // Set the input and output feature names for the request
        request.imageCropAndScaleOption = .scaleFit
        return request
    }

    private func getMLModel() -> MLModel? {
        do {
            let config = MLModelConfiguration()
            return try DeepLabV3(configuration: config).model
        } catch {
            debugPrint("Error loading model: \(error)")
            return nil

        }
    }
}
