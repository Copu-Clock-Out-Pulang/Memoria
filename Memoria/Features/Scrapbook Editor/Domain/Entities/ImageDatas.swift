//
//  ImageDatas.swift
//  Memoria
//
//  Created by Ronald Sumichael Sunan on 03/05/23.
//

import Foundation

struct ImageDatas: Codable {
    var id: Int
    var image: String
    var center: CGPoint
    var frame: CGRect
    var filter: String
}
