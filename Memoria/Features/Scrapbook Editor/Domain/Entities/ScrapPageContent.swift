//
//  Content.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 05/05/23.
//

import Foundation

struct ScrapPageContent: Codable {
    var drawing: String
    var images: [ImageDatas]
    var canvasColor: RGBValue
}
