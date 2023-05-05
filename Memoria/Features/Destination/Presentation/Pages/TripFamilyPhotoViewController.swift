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


}
