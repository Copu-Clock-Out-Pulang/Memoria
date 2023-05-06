//
//  ScrapBookDetailViewController.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 03/05/23.
//

import UIKit
import SwiftUI
import SnapKit

class ScrapBookDetailViewController: UIViewController {

    private let scrapBookTitle = "Page Title"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Poppins-Bold", size: 22)!]

        self.title = scrapBookTitle

        let rootView = ScrapBookDetailView()

        let hostingController = UIHostingController(rootView: rootView)

        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(view)
        }
        hostingController.didMove(toParent: self)
    }
}
