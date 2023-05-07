//
//  TripFamilyPhotoViewController.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 06/05/23.
//

import UIKit
import SwiftUI

class TripFamilyPhotoViewController: UIViewController {

    private let viewModel: DestinationViewModel


    init(viewModel: DestinationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = S.appName
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)


        let hostingController = UIHostingController(
            rootView: TripFamilyPhotoViewUI(viewModel: viewModel, controller: self))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view)
        }
        hostingController.didMove(toParent: self)
    }
    
    func navigateToDestination() {
        let destination = TripDestinationViewController(viewModel: viewModel)
        navigationController?.pushViewController(destination, animated: true)
    }


}
