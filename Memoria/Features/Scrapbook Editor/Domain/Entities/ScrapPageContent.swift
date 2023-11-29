//
//  Content.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 05/05/23.
//

import Foundation
import UIKit
import PencilKit

struct ScrapPageContent: Codable {
    var drawing: String
    var images: [ImageDatas]
    var canvasColor: RGBValue
}

extension ScrapPageContent {
    static func initialContent(image: UIImage) -> String {
        var encodedContent = ""
        var content = ScrapPageContent(drawing: "", images: [], canvasColor: RGBValue(colorR: 0, colorG: 0, colorB: 0, colorA: 0))

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
