//
//  ImageStackComponent.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 04/05/23.
//

import UIKit

extension ScrapbookEditorViewController {
    // MARK: Make Image View Without Saved Sata
    func makeImageView(image: UIImage, color: UIColor = .clear, scale: CGFloat = 0.25, isShape: Bool) {
        // Nil Image Safe Guard
        if image.pngData() == nil {
            return
        }
        
        var colorR: CGFloat = 0
        var colorG: CGFloat = 0
        var colorB: CGFloat = 0
        var colorA: CGFloat = 0
        color.getRed(&colorR, green: &colorG, blue: &colorB, alpha: &colorA)
        
//        print(colorR, colorG, colorB, colorA)
        
        let imageView = UIImageView(image: image)
        imageView.tintColor = color
        imageView.transform = imageView.transform.scaledBy(x: scale, y: scale)
        imageView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        imageView.tag = editorViewModel.imageStacks.count + 1
        imageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureHandler)))
        imageView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGestureHandler)))
        imageView.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(self.rotateGestureHandler)))
        imageView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureHandler)))
    
        imageView.isUserInteractionEnabled = true
        editorViewModel.canvasView.addSubview(imageView)
        editorViewModel.imageStacks.append(ImageDatas(
            id: imageView.tag, image: (image.pngData()?.base64EncodedString()) ?? "", center: imageView.center, frame: imageView.frame,
            filter: "None", isShape: isShape, colorR: colorR, colorG: colorG, colorB: colorB, colorA: colorA
        ))
        print("Image View Created")
    }
    
    // MARK: Make Image View With Saved Data
    func makeImageView(image: UIImage, tag: Int, center: CGPoint, frame: CGRect, filter: String, isShape: Bool, color: RGBValue) {
        
        var newImage: UIImage
        if isShape {
            newImage = image.withRenderingMode(.alwaysTemplate)
        } else {
            newImage = image
        }
        
        let imageView = UIImageView(image: newImage)
        imageView.frame = frame
        imageView.center = center
//        imageView.transform = imageView.transform.rotated(by: rotation)
        imageView.tintColor = UIColor(red: color.colorR, green: color.colorG, blue: color.colorB, alpha: color.colorA)
        imageView.tag = tag
        imageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureHandler)))
        imageView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGestureHandler)))
        imageView.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(self.rotateGestureHandler)))
        imageView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureHandler)))
        
        if filter == "Sepia" {
            imageView.image = UIImage(cgImage: sepiaFilter(cgImage: image.cgImage!))
        } else if filter == "Blur" {
            imageView.image = UIImage(cgImage: blurFilter(cgImage: image.cgImage!))
        } else if filter == "Invert" {
            imageView.image = UIImage(cgImage: invertFilter(cgImage: image.cgImage!))
        }
        
        imageView.isUserInteractionEnabled = true
        editorViewModel.canvasView.addSubview(imageView)
        editorViewModel.imageStacks.append(ImageDatas(
            id: tag, image: (image.pngData()?.base64EncodedString()) ?? "", center: imageView.center, frame: imageView.frame,
            filter: filter, isShape: isShape, colorR: color.colorR, colorG: color.colorG, colorB: color.colorB, colorA: color.colorA
        ))
    }
    
    // MARK: Redraw Canvas on Top
    func redrawTopCanvas(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.center = editorViewModel.canvasView.center
        imageView.tag = 1
        view.addSubview(imageView)
    }
}
