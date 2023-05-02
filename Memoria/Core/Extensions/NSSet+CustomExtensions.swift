//
//  NSSet+CustomExtensions.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 02/05/23.
//

import Foundation

extension NSSet {
  func toArray<T>() -> [T] {
    let array = self.map { $0 as! T }
    return array
  }
}
