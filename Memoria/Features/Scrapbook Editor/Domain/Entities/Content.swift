//
//  Content.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 05/05/23.
//

import Foundation

struct Content: Codable {
    var drawing: String
    var images: [ImageDatas]
    var canvasColor: RGBValue
}
