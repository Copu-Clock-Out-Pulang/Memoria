//
//  ImageFilterComponent.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 04/05/23.
//

import UIKit

extension ScrapbookEditorViewController {
    // MARK: Choose Filter Action
    func chooseFilter(view: UIView) {
        print("Set Image Filter")
        let image = UIImage(data: Data(base64Encoded: imageStacks[view.tag - 1].image)!)!

        let optionMenu = UIAlertController(title: nil, message: "Set Filter", preferredStyle: .alert)
        let normalAction = UIAlertAction(title: "None", style: .default) {_ in
            print("None")
            self.setFilter(image: image, imageView: view as! UIImageView, tag: view.tag, filter: "None")
        }
        let sepiaAction = UIAlertAction(title: "Sepia", style: .default) {_ in
            print("Sepia")
            self.setFilter(image: image, imageView: view as! UIImageView, tag: view.tag, filter: "Sepia")
        }
        let blurAction = UIAlertAction(title: "Blur", style: .default) {_ in
            print("Blur")
            self.setFilter(image: image, imageView: view as! UIImageView, tag: view.tag, filter: "Blur")
        }
        let invertAction = UIAlertAction(title: "Invert", style: .default) {_ in
            print("Invert")
            self.setFilter(image: image, imageView: view as! UIImageView, tag: view.tag, filter: "Invert")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {_ in
            print("Cancel")
        }

        optionMenu.addAction(normalAction)
        optionMenu.addAction(sepiaAction)
        optionMenu.addAction(blurAction)
        optionMenu.addAction(invertAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true)
    }

    // MARK: Adding Filter to Image
    func setFilter(image: UIImage, imageView: UIImageView, tag: Int, filter: String) {
        if filter == "None" {
            imageView.image = image
        } else if filter == "Sepia" {
            imageView.image = UIImage(cgImage: sepiaFilter(cgImage: image.cgImage!))
        } else if filter == "Blur" {
            imageView.image = UIImage(cgImage: blurFilter(cgImage: image.cgImage!))
        } else if filter == "Invert" {
            imageView.image = UIImage(cgImage: invertFilter(cgImage: image.cgImage!))
        }

        imageStacks[tag - 1].filter = filter
    }

    func sepiaFilter(cgImage: CGImage) -> CGImage {
        let ciImage = CIImage(cgImage: cgImage)
        let filter = CIFilter.sepiaTone()
        filter.setValue(ciImage, forKey: kCIInputImageKey)

        let output = filter.outputImage

        return ciContext.createCGImage(output!, from: output!.extent)!
    }

    func blurFilter(cgImage: CGImage) -> CGImage {
        let ciImage = CIImage(cgImage: cgImage)
        let filter = CIFilter.motionBlur()
        filter.setValue(ciImage, forKey: kCIInputImageKey)

        let output = filter.outputImage

        return ciContext.createCGImage(output!, from: output!.extent)!
    }

    func invertFilter(cgImage: CGImage) -> CGImage {
        let ciImage = CIImage(cgImage: cgImage)
        let filter = CIFilter.colorInvert()
        filter.setValue(ciImage, forKey: kCIInputImageKey)

        let output = filter.outputImage

        return ciContext.createCGImage(output!, from: output!.extent)!
    }
}
