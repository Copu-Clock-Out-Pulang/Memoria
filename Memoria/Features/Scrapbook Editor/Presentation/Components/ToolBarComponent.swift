//
//  ToolBarComponent.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 04/05/23.
//

import UIKit
import PhotosUI

extension ScrapbookEditorViewController {
    // MARK: Adding ToolBar
    func makeToolBarItems() {
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.backgroundColor = I.background.color(compatibleWith: .current)
        toolbarItems = [
            UIBarButtonItem(systemItem: .flexibleSpace),
            makeNavbarButton(image: UIImage(named: "ToolBarIcon/Photo")!, action: #selector(openInsertOption)),
            UIBarButtonItem(systemItem: .flexibleSpace),
            makeNavbarButton(image: UIImage(named: "ToolBarIcon/Background")!, action: #selector(changeCanvasBackground)),
            UIBarButtonItem(systemItem: .flexibleSpace),
            makeNavbarButton(image: UIImage(named: "ToolBarIcon/Sticker")!, action: #selector(chooseSticker)),
            UIBarButtonItem(systemItem: .flexibleSpace),
            makeNavbarButton(image: UIImage(named: "ToolBarIcon/Scribble")!, action: #selector(openToolPicker)),
            UIBarButtonItem(systemItem: .flexibleSpace),
            makeNavbarButton(image: UIImage(named: "ToolBarIcon/Shape")!, action: #selector(chooseShape)),
            UIBarButtonItem(systemItem: .flexibleSpace)
        ]
        navigationController?.toolbar.tintColor = I.textPrimary.color(compatibleWith: .current)
    }
    
    // MARK: Make BarButton
    func makeNavbarButton(image: UIImage, action: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
        return barButton
    }
    
    // MARK: Insert Image Action
    @objc func openInsertOption(_ sender: Any) {
        editorViewModel.toolContentView?.removeFromSuperview()
        let optionMenu = UIAlertController(title: "Insert Image From", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            print("Camera")
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            self.present(picker, animated: true)
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { _ in
            print("Gallery")
            var config = PHPickerConfiguration(photoLibrary: .shared())
            config.selectionLimit = 1
            config.filter = .images
            let picker = PHPickerViewController(configuration: config)
            picker.delegate = self
            self.present(picker, animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {_ in
            print("Cancel")
        }
        
        optionMenu.addAction(cameraAction)
        optionMenu.addAction(galleryAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true)
    }
    
    @objc func changeCanvasBackground(_ sender: Any) {
        editorViewModel.toolContentView?.removeFromSuperview()
        if editorViewModel.selectedTool == "Background" {
            editorViewModel.selectedTool = ""
        } else if editorViewModel.selectedTool != "Background" {
            editorViewModel.selectedTool = "Background"
            editorViewModel.toolContentCount = 8
            makeToolBarContent()
        }
    }
    
    @objc func chooseSticker(_ sender: Any) {
        editorViewModel.toolContentView?.removeFromSuperview()
        if editorViewModel.selectedTool == "Sticker" {
            editorViewModel.selectedTool = ""
        } else {
            editorViewModel.selectedTool = "Sticker"
            editorViewModel.toolContentCount = 15
            makeToolBarContent()
        }
    }
    
    @objc func chooseShape(_ sender: Any) {
        editorViewModel.toolContentView?.removeFromSuperview()
        if editorViewModel.selectedTool == "Shape" {
            editorViewModel.selectedTool = ""
        } else {
            editorViewModel.selectedTool = "Shape"
            editorViewModel.toolContentCount = 6
            makeToolBarContent()
        }
    }
}


// MARK: Image Gallery
extension ScrapbookEditorViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        let group = DispatchGroup()
        
        results.forEach { result in
            group.enter()
            result.itemProvider.loadObject(ofClass: UIImage.self) {reading, error in
                defer {
                    group.leave()
                }
                guard let image = reading as? UIImage, error == nil else {
                    return
                }
                print(image)
                self.editorViewModel.inputImage = image
            }
        }
        
        group.notify(queue: .main) {
            self.makeImageView(image: self.editorViewModel.inputImage, isShape: false)
        }
    }
}


// MARK: In-App Camera
extension ScrapbookEditorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        self.makeImageView(image: image, isShape: false)
        self.editorViewModel.inputImage = image
    }
}
