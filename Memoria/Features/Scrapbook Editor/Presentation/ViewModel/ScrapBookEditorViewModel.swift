//
//  ScrapBookEditorViewModel.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 06/05/23.
//

import UIKit
import PencilKit

class ScrapBookEditorViewModel {
    // Canvas
    let canvasView = PKCanvasView()
    let toolPicker = PKToolPicker()
    var drawing = PKDrawing()

    // Import Image
    var inputImage = UIImage()
    
    // Context
    let ciContext = InjectionContainer.shared.container.resolve(CIContext.self)!
    
    // Data
    var scrapPageStack = ScrapPageStackData(id: UUID(), content: "", thumbnail: "")
    var imageStacks: [ImageDatas] = []
    
    // UI
    let background = UIImageView(image: UIImage(named: "ScrapPageEditorBackground"))
    var toolContentView: UICollectionView?
    
    // ToolBar Data
    var selectedTool = ""
    var toolContentCount = 0
    
    // Import Shape
    var selectedColor: UIColor = .clear
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
    
    func makeInitialContent(image: UIImage) -> String {
        var encodedContent = ""
        var content = Content(drawing: "", images: [], canvasColor: RGBValue(colorR: 0, colorG: 0, colorB: 0, colorA: 0))
        
        let encodedImage = image.pngData()?.base64EncodedString()
        let screenWH = UIScreen.main.bounds
        let center = CGPoint(x: screenWH.width / 2, y: screenWH.height / 2)
        
        content.drawing = PKDrawing().dataRepresentation().base64EncodedString()
        
        I.background.color(compatibleWith: .current).getRed(&content.canvasColor.colorR, green: &content.canvasColor.colorG, blue: &content.canvasColor.colorB, alpha: &content.canvasColor.colorA)
        
        content.images.append(ImageDatas(
            id: 1, image: encodedImage!, center: center, frame: CGRect(origin: center, size: image.size),
            filter: "None", isShape: false, colorR: 0, colorG: 0, colorB: 0, colorA: 0
        ))
        
        do {
            encodedContent = try JSONEncoder().encode(content).base64EncodedString()
        } catch {
            print("----", error)
        }
        
        return encodedContent
    }
}
