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
    static func spacer(size: CGFloat = 10, for layout: NSLayoutConstraint.Axis = .horizontal) -> UIView {
        let spacer = UIView()

        if layout == .horizontal {
            spacer.widthAnchor.constraint(equalToConstant: size).isActive = true
        } else {
            spacer.heightAnchor.constraint(equalToConstant: size).isActive = true
        }

        return spacer
    }

}
