//
//  GestureHandlerComponent.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 04/05/23.
//

import UIKit

extension ScrapbookEditorViewController {
    @objc func panGestureHandler(sender: UIPanGestureRecognizer) {
        print("Masuk Pan Gesture \(sender.view!.tag)")
        let image = sender.view!
        editorViewModel.canvasView.bringSubviewToFront(image)
        let translation = sender.translation(in: editorViewModel.canvasView)
        sender.setTranslation(CGPoint.zero, in: editorViewModel.canvasView)
        image.center = CGPoint(x: image.center.x + translation.x, y: image.center.y + translation.y)
        
        if sender.state == .ended {
            editorViewModel.imageStacks[image.tag - 1].center = image.center
        }
    }
    
    @objc func pinchGestureHandler(sender: UIPinchGestureRecognizer) {
        print("Masuk Pinch Gesture \(sender.view!.tag)")
        let image = sender.view!
        editorViewModel.canvasView.bringSubviewToFront(image)
        image.transform = image.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0
        
        if sender.state == .ended {
            editorViewModel.imageStacks[image.tag - 1].frame = image.frame
        }
    }
    
    @objc func rotateGestureHandler(sender: UIRotationGestureRecognizer) {
        print("Masuk Rotation Gesture \(sender.view!.tag)")
        let image = sender.view!
        editorViewModel.canvasView.bringSubviewToFront(image)
        image.transform = image.transform.rotated(by: sender.rotation)
        sender.rotation = 1 * .pi / 180
        
//        if sender.state == .ended {
//            let rotation = atan2(Double(image.transform.b), Double(image.transform.a))
//            let rotation = atan2(Double(image.transform.b), Double(image.transform.a)) - atan2(Double(temp.transform.b), Double(temp.transform.a))
//            print(rotation)
//            temp.transform = temp.transform.rotated(by: rotation)
//            imageStacks[image.tag - 1].rotation = rotation
//        }
    }
    
    @objc func longPressGestureHandler(sender: UILongPressGestureRecognizer) {
        print("Masuk Long Press Gesture \(sender.view!.tag)")
        let optionMenu = UIAlertController(title: nil, message: "Edit Image", preferredStyle: .alert)
        let filterAction = UIAlertAction(title: "Filter", style: .default) {_ in
            print("Filter")
            self.chooseFilter(view: sender.view!)
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) {_ in
            print("Delete")
            self.editorViewModel.imageStacks[sender.view!.tag - 1].image = ""
            print(self.editorViewModel.imageStacks.count)
            sender.view!.removeFromSuperview()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {_ in
            print("Cancel")
        }
        
        optionMenu.addAction(filterAction)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true)
    }
}
