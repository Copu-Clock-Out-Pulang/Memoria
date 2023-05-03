//
//  UIView+CustomExtensions.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 02/05/23.
//

import Foundation
import UIKit

extension UIView {
    func addSubViews(view: [UIView]) {
        view.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
