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

    private let viewModel: ScrapPageViewModel

    // Passed Data
    var scrapPageName: String?
    var scrapPageContent: String?
    var scrapPageThumbnail: String?

    // Canvas
    let canvasView = PKCanvasView()
    let toolPicker = PKToolPicker()
    var drawing = PKDrawing()

    // Import Image
    var inputImage = UIImage()

    // Context
    let ciContext = InjectionContainer.shared.container.resolve(CIContext.self)!

    var scrapPageStack = ScrapPageStackData(id: UUID(), content: "", thumbnail: "")
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

    init(scrapPageName: String, scrapPageContent: String, scrapPageThumbnail: String, viewModel: ScrapPageViewModel) {
        self.scrapPageName = scrapPageName
        self.scrapPageContent = scrapPageContent
        self.scrapPageThumbnail = scrapPageThumbnail
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print(scrapPageName)
        print(scrapPageContent)
        print(scrapPageThumbnail)

        background.frame = view.frame
        view.insertSubview(background, at: 0)

        makeNavigationBar()
        checkPermission()
        makeToolBarItems()
        makeCanvasView()

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

        var savedContent = Content(drawing: "", images: [], canvasColor: RGBValue(colorR: 0, colorG: 0, colorB: 0, colorA: 0))

        savedContent.drawing = canvasView.drawing.dataRepresentation().base64EncodedString()

        var saveValueR: CGFloat = 0
        var saveValueG: CGFloat = 0
        var saveValueB: CGFloat = 0
        var saveValueA: CGFloat = 0
        canvasView.backgroundColor?.getRed(&saveValueR, green: &saveValueG, blue: &saveValueB, alpha: &saveValueA)

        savedContent.canvasColor.colorR = saveValueR
        savedContent.canvasColor.colorG = saveValueG
        savedContent.canvasColor.colorB = saveValueB
        savedContent.canvasColor.colorA = saveValueA

        savedContent.images = imageStacks

        do {
            let encoded = try JSONEncoder().encode(savedContent)
            scrapPageStack.content = encoded.base64EncodedString()

            scrapPageContent = encoded.base64EncodedString()
        } catch {
            print("----", error)
        }

        UIGraphicsBeginImageContextWithOptions(canvasView.bounds.size, false, UIScreen.main.scale)
        view.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: true)

        let thumbnail = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        scrapPageStack.thumbnail = (thumbnail?.pngData()?.base64EncodedString())!
        scrapPageThumbnail = (thumbnail?.pngData()?.base64EncodedString())!

        viewModel.saveScrapPage(
            name: scrapPageName!, thumbnail: scrapPageThumbnail!, content: scrapPageContent!
        )

    }

    // Load Canvas Progress
    @objc func loadData(sender: Any) {
        imageStacks.removeAll()

        var loadedContent: Content?

        do {
            //            loadedContent = try JSONDecoder().decode(Content.self, from: Data(base64Encoded: scrapPageStack.content)!)
            loadedContent = try JSONDecoder().decode(Content.self, from: Data(base64Encoded: scrapPageContent!)!)
        } catch {
            print("----", error)
        }

        do {
            canvasView.drawing = try PKDrawing(data: Data(base64Encoded: loadedContent!.drawing)!)
        } catch {
            print("Error While Loading Drawing", error)
        }

        canvasView.backgroundColor = UIColor(
            red: loadedContent!.canvasColor.colorR, green: loadedContent!.canvasColor.colorG,
            blue: loadedContent!.canvasColor.colorB, alpha: loadedContent!.canvasColor.colorA
        )

        loadedContent!.images.forEach { data in
            let image = UIImage(data: Data(base64Encoded: data.image)!)
            let color = RGBValue(colorR: data.colorR, colorG: data.colorG, colorB: data.colorB, colorA: data.colorA)
            makeImageView(
                image: image ?? UIImage(), tag: data.id, center: data.center,
                frame: data.frame, filter: data.filter, isShape: data.isShape, color: color
            )
        }

        redrawTopCanvas(image: canvasView.drawing.image(from: canvasView.bounds, scale: 1))
    }
}
