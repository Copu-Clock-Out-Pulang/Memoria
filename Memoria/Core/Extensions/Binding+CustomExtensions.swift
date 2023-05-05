//
//  Binding+CustomExtensions.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 03/05/23.
//

import SwiftUI

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.dropLast())
            }
        }
        return self
    }
}
