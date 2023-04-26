//
//  UIImage+Extensions.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 19/04/23.
//

import Foundation
import UIKit

extension UIImage {
    class func imageFromColor(color: UIColor, size: CGSize = CGSize(width: 1, height: 1), scale: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    func resizedImage(for size: CGSize) -> UIImage? {
        guard let image = self.cgImage else { return nil }
        let colorSpace = image.colorSpace ?? CGColorSpace(name: CGColorSpace.sRGB)
        debugPrint(size)
        let context = CGContext(
            data: nil,
            width: Int(size.width),
            height: Int(size.height),
            bitsPerComponent: image.bitsPerComponent,
            bytesPerRow: Int(size.width),
            space: colorSpace!,
            bitmapInfo: image.bitmapInfo.rawValue)
        context?.interpolationQuality = .high
        context?.draw(image, in: CGRect(origin: .zero, size: size))

        guard let scaledImage = context?.makeImage() else { return nil }

        return UIImage(cgImage: scaledImage)
    }
    
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
            // Determine the scale factor that preserves aspect ratio
            let widthRatio = targetSize.width / size.width
            let heightRatio = targetSize.height / size.height
            
            let scaleFactor = min(widthRatio, heightRatio)
            
            // Compute the new image size that preserves aspect ratio
            let scaledImageSize = CGSize(
                width: size.width * scaleFactor,
                height: size.height * scaleFactor
            )

            // Draw and return the resized UIImage
            let renderer = UIGraphicsImageRenderer(
                size: scaledImageSize
            )

            let scaledImage = renderer.image { _ in
                self.draw(in: CGRect(
                    origin: .zero,
                    size: scaledImageSize
                ))
            }
            
            return scaledImage
        }
    
    
    func resizeSquare(toTargetSize targetSize: CGSize) -> UIImage {
           // inspired by Hamptin Catlin
           // https://gist.github.com/licvido/55d12a8eb76a8103c753

           let newScale = self.scale // change this if you want the output image to have a different scale
           let originalSize = self.size

           let widthRatio = targetSize.width / originalSize.width
           let heightRatio = targetSize.height / originalSize.height

           // Figure out what our orientation is, and use that to form the rectangle
           let newSize: CGSize
           if widthRatio > heightRatio {
               newSize = CGSize(width: floor(originalSize.width * heightRatio), height: floor(originalSize.height * heightRatio))
           } else {
               newSize = CGSize(width: floor(originalSize.width * widthRatio), height: floor(originalSize.height * widthRatio))
           }

           // This is the rect that we've calculated out and this is what is actually used below
           let rect = CGRect(origin: .zero, size: newSize)

           // Actually do the resizing to the rect using the ImageContext stuff
           let format = UIGraphicsImageRendererFormat()
           format.scale = newScale
           format.opaque = true
           let newImage = UIGraphicsImageRenderer(bounds: rect, format: format).image() { _ in
               self.draw(in: rect)
           }

           return newImage
       }
}


extension UIImage {
    func withAlphaComponent(_ alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }

        draw(at: .zero, blendMode: .normal, alpha: alpha)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
