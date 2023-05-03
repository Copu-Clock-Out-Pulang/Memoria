//
//  ScrapbookEditorViewController.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 03/05/23.
//

import UIKit
import PencilKit
import PhotosUI
import CoreImage.CIFilterBuiltins

class ScrapbookEditorViewController: UIViewController, PKCanvasViewDelegate {

    // Canvas
    let canvasView = PKCanvasView()
    let toolPicker = PKToolPicker()
    var drawing = PKDrawing()

    // Import Image
    var inputImage = UIImage()
    
    // Filter
    let ciContext = InjectionContainer.shared.container.resolve(CIContext.self)!
//    let ciContext = CIContext()
    
    var scrapPageStack = ScrapPageStackData(id: UUID(), drawing: "", images: "")
    var imageStacks: [ImageDatas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        checkPermission()
        makeToolBarItems()
        makeLeftNavigationItems()
        makeRightNavigationItems()
        makeCanvasView()
        redrawTopCanvas(image: canvasView.drawing.image(from: canvasView.bounds, scale: 1))
    }

    // Check Camera and Gallery Permission
    func checkPermission() {
        if PHPhotoLibrary.authorizationStatus(for: .readWrite) != .authorized {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { _ in
                print("Photos Access Granted")
            }
        }
        if AVCaptureDevice.authorizationStatus(for: .video) != .authorized {
            AVCaptureDevice.requestAccess(for: .video) { _ in
                print("Camera Access Granted")
            }
        }
    }
    
    // Making Canvas View
    func makeCanvasView() {
        view.addSubview(canvasView)
//        canvasView.backgroundColor = .clear
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        canvasView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        canvasView.delegate = self
        canvasView.drawing = drawing
    }

    // Adding ToolBar
    func makeToolBarItems() {
        self.navigationController?.isToolbarHidden = false
        toolbarItems = [
            UIBarButtonItem(systemItem: .flexibleSpace),
            UIBarButtonItem(image: UIImage(systemName: "camera"), style: .plain, target: self, action: #selector(openInsertOption)),
            UIBarButtonItem(systemItem: .flexibleSpace),
            UIBarButtonItem(image: UIImage(systemName: "squareshape"), style: .plain, target: self, action: #selector(clearDrawingHandler)),
            UIBarButtonItem(systemItem: .flexibleSpace),
            UIBarButtonItem(image: UIImage(systemName: "pencil.tip.crop.circle"), style: .plain, target: self, action: #selector(openToolPicker)),
            UIBarButtonItem(systemItem: .flexibleSpace)
        ]
    }
    
    // Left Navigation Item
    func makeLeftNavigationItems() {
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Load", style: .plain, target: self, action: #selector(loadData)), animated: true)
        navigationItem.leftBarButtonItems!.insert(UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearDrawingHandler)), at: 0)
    }
    
    // Right Navigation Item
    func makeRightNavigationItems() {
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareImage)), animated: true)
        navigationItem.rightBarButtonItems!.insert(UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveProgress)), at: 0)
    }
    
    // Drawing Left Navigation Item
    func makeDrawingLeftNavigationItem() {
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearDrawingHandler)), animated: true)
        navigationItem.leftBarButtonItems!.insert(UIBarButtonItem(title: "Undo", style: .plain, target: self, action: #selector(undoHandler)), at: 0)
    }
    
    // Drawing Right Navigation Item
    func makeDrawingRightNavigationItem() {
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Redo", style: .plain, target: self, action: #selector(redoHandler)), animated: true)
        navigationItem.rightBarButtonItems!.insert(UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closeToolPicker)), at: 0)
    }
    
    @objc func testHandler() {
        print("Handler")
    }
    
    // Export Image
    @objc func shareImage(_ sender: Any) {
        print("Share Image")
        
        UIGraphicsBeginImageContextWithOptions(canvasView.bounds.size, false, UIScreen.main.scale)
        view.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: true)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if image != nil {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image!)
            }, completionHandler: {success, error in
                print(success)
                print(error ?? "No Error")
            })
        }
    }
    
    // Insert Image Action
    @objc func openInsertOption(_ sender: Any) {
        let optionMenu = UIAlertController(title: "Insert Image From", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {_ in
            print("Camera")
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            self.present(picker, animated: true)
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) {_ in
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
    
    // Open ToolPicker
    @objc func openToolPicker(_ sender: Any) {
        canvasView.subviews.forEach { sub in
            print(sub)
            if sub.tag >= 1 {
                sub.isUserInteractionEnabled = false
                sub.alpha = 0.1
            }
        }
        view.subviews.forEach {sub in
            print(sub)
            if sub.tag == 1 {
                sub.removeFromSuperview()
            }
        }
        
        canvasView.drawingPolicy = .anyInput
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
        
        navigationItem.rightBarButtonItems!.removeAll()
        navigationItem.leftBarButtonItems!.removeAll()
        makeDrawingLeftNavigationItem()
        makeDrawingRightNavigationItem()
    }
    
    // Close ToolPicker
    @objc func closeToolPicker() {
        canvasView.subviews.forEach { sub in
            sub.isUserInteractionEnabled = true
            sub.alpha = 1
        }
        canvasView.drawingPolicy = .pencilOnly
        toolPicker.setVisible(false, forFirstResponder: canvasView)
        toolPicker.removeObserver(canvasView)
        
        redrawTopCanvas(image: canvasView.drawing.image(from: canvasView.bounds, scale: 1))
        
        navigationItem.leftBarButtonItems!.removeAll()
        navigationItem.rightBarButtonItems!.removeAll()
        makeLeftNavigationItems()
        makeRightNavigationItems()
    }
    
    // Undo Handler
    @objc func undoHandler() {
        undoManager?.undo()
    }
    
    // Redo Handler
    @objc func redoHandler() {
        undoManager?.redo()
    }
    
    // Make Image View without saved data
    func makeImageView(image: UIImage) {
        // Nil Image Safe Guard
        if image.pngData() == nil {
            return
        }
        
        let imageView = UIImageView(image: image)
        imageView.transform = imageView.transform.scaledBy(x: 0.25, y: 0.25)
        imageView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        imageView.tag = imageStacks.count + 1
        imageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureHandler)))
        imageView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGestureHandler)))
        imageView.addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: #selector(self.rotateGestureHandler)))
        imageView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureHandler)))
    
        imageView.isUserInteractionEnabled = true
        canvasView.addSubview(imageView)
        imageStacks.append(ImageDatas(id: imageView.tag, image: (image.pngData()?.base64EncodedString()) ?? "", center: imageView.center, frame: imageView.frame, filter: "None"))
        print("Image View Created")
    }
    
    // Make Image View with saved data
    func makeImageView(image: UIImage, tag: Int, center: CGPoint, frame: CGRect, filter: String) {
        let imageView = UIImageView(image: image)
        imageView.frame = frame
        imageView.center = center
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
        canvasView.addSubview(imageView)
        imageStacks.append(ImageDatas(id: tag, image: (image.pngData()?.base64EncodedString()) ?? "", center: imageView.center, frame: imageView.frame, filter: filter))
    }
    
    // Adding Filter to Image
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
    
    // Redraw Canvas on Top
    func redrawTopCanvas(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.center = canvasView.center
        imageView.tag = 1
        view.addSubview(imageView)
    }
    
    // Save Canvas Progress
    @objc func saveProgress(sender: Any) {
        print("Save Progress")
//        let datas = try! encoder.encode(imageStacks)
//        imageData = inputImage.pngData()?.base64EncodedString()
//        encodedDrawing = canvasView.drawing.dataRepresentation().base64EncodedString()
        
        scrapPageStack.drawing = canvasView.drawing.dataRepresentation().base64EncodedString()
        
        do {
            let encoded = try JSONEncoder().encode(imageStacks)
            scrapPageStack.images = encoded.base64EncodedString()
//            print(scrapPageStack)
        } catch {
            print("-----", error)
        }
        
//        scrapPageStack.images.append(contentsOf: imageStacks)
    }
    
    // Clear All Canvas Drawing
    @objc func clearDrawingHandler(sender: Any) {
        print("Test Handler")
        canvasView.drawing = PKDrawing()
        view.subviews.forEach {sub in
            if sub.tag == 1 {
                sub.removeFromSuperview()
            }
        }
        redrawTopCanvas(image: canvasView.drawing.image(from: canvasView.bounds, scale: 1))
    }
    
    // Load Canvas Progress
    @objc func loadData(sender: Any) {
        imageStacks.removeAll()
        
        do {
            canvasView.drawing = try PKDrawing(data: Data(base64Encoded: scrapPageStack.drawing)!)
        } catch {
            print("Error While Loading Drawing", error)
        }
        
        var decodedStacks: [ImageDatas]
        do {
            decodedStacks = try JSONDecoder().decode([ImageDatas].self, from: Data(base64Encoded: scrapPageStack.images) ?? Data())
            print(decodedStacks)
            decodedStacks.forEach { data in
                let image = UIImage(data: Data(base64Encoded: data.image)!)
                makeImageView(image: image ?? UIImage(), tag: data.id, center: data.center, frame: data.frame, filter: data.filter)
            }
        } catch {
            print("----", error)
        }
        
        redrawTopCanvas(image: canvasView.drawing.image(from: canvasView.bounds, scale: 1))
    }
}

// Image Gallery
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
                self.inputImage = image
            }
        }
        
        group.notify(queue: .main) {
            self.makeImageView(image: self.inputImage)
        }
    }
}


// In-App Camera
extension ScrapbookEditorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        self.makeImageView(image: image)
        self.inputImage = image
    }
}

// Gesture
extension ScrapbookEditorViewController {
    @objc func panGestureHandler(sender: UIPanGestureRecognizer) {
        print("Masuk Pan Gesture \(sender.view!.tag)")
        let image = sender.view!
        canvasView.bringSubviewToFront(image)
        let translation = sender.translation(in: self.canvasView)
        sender.setTranslation(CGPoint.zero, in: self.canvasView)
        image.center = CGPoint(x: image.center.x + translation.x, y: image.center.y + translation.y)
        
        if sender.state == .ended {
            imageStacks[image.tag - 1].center = image.center
        }
    }
    
    @objc func pinchGestureHandler(sender: UIPinchGestureRecognizer) {
        print("Masuk Pinch Gesture \(sender.view!.tag)")
        let image = sender.view!
        canvasView.bringSubviewToFront(image)
        image.transform = image.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0
        
        if sender.state == .ended {
            imageStacks[image.tag - 1].frame = image.frame
        }
    }
    
    @objc func rotateGestureHandler(sender: UIRotationGestureRecognizer) {
        print("Masuk Rotation Gesture \(sender.view!.tag)")
        let image = sender.view!
        canvasView.bringSubviewToFront(image)
        image.transform = image.transform.rotated(by: sender.rotation)
        sender.rotation = 1 * .pi / 180
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
            self.imageStacks[sender.view!.tag - 1].image = ""
            print(self.imageStacks.count)
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
}

// Image Filter
extension ScrapbookEditorViewController {
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
