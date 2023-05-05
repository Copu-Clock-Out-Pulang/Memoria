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
    
    // Context
    let ciContext = InjectionContainer.shared.container.resolve(CIContext.self)!
    
    // Data
    var scrapPageStack = ScrapPageStackData(id: UUID(), drawing: "", images: "", canvasColor: RGBValue(colorR: 1, colorG: 0.957, colorB: 0.918, colorA: 1))
    var imageStacks: [ImageDatas] = []
    var pageTitle = "Page Title"
    
    // UI
    let background = UIImageView(image: UIImage(named: "ScrapPageEditorBackground"))
    var toolContentView: UICollectionView?
    
    // ToolBar Data
    var selectedTool = ""
    var toolContentCount = 0
    
    // Import Shape
    var selectedColor: UIColor = .white
    var selectedShape: Int = 0
    
    // Import Canvas Background
    let canvasColors = [
        UIColor(named: "CanvasColor/0"),
        UIColor(named: "CanvasColor/1"),
        UIColor(named: "CanvasColor/2"),
        UIColor(named: "CanvasColor/3"),
        UIColor(named: "CanvasColor/4"),
        UIColor(named: "CanvasColor/5"),
        UIColor(named: "CanvasColor/6"),
        UIColor(named: "CanvasColor/7")
    ]
    
//    var tempImage = UIImage(named: "ToolBarIcon/Photo")
    
    var temp: String?
    
    init(temp: String) {
        super.init(nibName: nil, bundle: nil)
        self.temp = temp
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(temp)
        
        background.frame = view.frame
        view.insertSubview(background, at: 0)
        
        makeNavigationBar()
        checkPermission()
        makeToolBarItems()
        makeCanvasView()
        
//        let tempView = UIImageView(image: tempImage)
//        tempView.frame = canvasView.frame
//        tempView.center = view.center
//        tempView.tintColor = .cyan
//        canvasView.addSubview(tempView)
        
        redrawTopCanvas(image: canvasView.drawing.image(from: canvasView.bounds, scale: 1))
    }

    // MARK: Check Camera and Gallery Permission
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
    
    // MARK: Making Canvas View
    func makeCanvasView() {
        view.addSubview(canvasView)
        canvasView.backgroundColor = I.CanvasColor._7.color(compatibleWith: .current)
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36).isActive = true
        canvasView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -36).isActive = true
        canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31).isActive = true
        canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31).isActive = true
        canvasView.layer.cornerRadius = 30
        canvasView.delegate = self
        canvasView.drawing = drawing
    }
    
    @objc func testHandler() {
        print("Handler")
    }
    
    // MARK: Export Image
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
}


// MARK: Save and Load
extension ScrapbookEditorViewController {
    // Save Canvas Progress
    @objc func saveProgress(sender: Any) {
        print("Save Progress")
        
        scrapPageStack.drawing = canvasView.drawing.dataRepresentation().base64EncodedString()
        
        var saveValueR: CGFloat = 0
        var saveValueG: CGFloat = 0
        var saveValueB: CGFloat = 0
        var saveValueA: CGFloat = 0
        canvasView.backgroundColor?.getRed(&saveValueR, green: &saveValueG, blue: &saveValueB, alpha: &saveValueA)
        scrapPageStack.canvasColor.colorR = saveValueR
        scrapPageStack.canvasColor.colorG = saveValueG
        scrapPageStack.canvasColor.colorB = saveValueB
        scrapPageStack.canvasColor.colorA = saveValueA
        
        do {
            let encoded = try JSONEncoder().encode(imageStacks)
            scrapPageStack.images = encoded.base64EncodedString()
//            print(scrapPageStack)
        } catch {
            print("-----", error)
        }
    }
    
    // Load Canvas Progress
    @objc func loadData(sender: Any) {
        imageStacks.removeAll()
        
        do {
            canvasView.drawing = try PKDrawing(data: Data(base64Encoded: scrapPageStack.drawing)!)
        } catch {
            print("Error While Loading Drawing", error)
        }
        
        canvasView.backgroundColor = UIColor(
            red: scrapPageStack.canvasColor.colorR, green: scrapPageStack.canvasColor.colorG,
            blue: scrapPageStack.canvasColor.colorB, alpha: scrapPageStack.canvasColor.colorA
        )
        
        var decodedStacks: [ImageDatas]
        do {
            decodedStacks = try JSONDecoder().decode([ImageDatas].self, from: Data(base64Encoded: scrapPageStack.images) ?? Data())
//            print(decodedStacks)
            decodedStacks.forEach { data in
                let image = UIImage(data: Data(base64Encoded: data.image)!)
                let color = RGBValue(colorR: data.colorR, colorG: data.colorG, colorB: data.colorB, colorA: data.colorA)
                makeImageView(
                    image: image ?? UIImage(), tag: data.id, center: data.center,
                    frame: data.frame, filter: data.filter, isShape: data.isShape, color: color
                )
            }
        } catch {
            print("----", error)
        }
        
        redrawTopCanvas(image: canvasView.drawing.image(from: canvasView.bounds, scale: 1))
    }
}
