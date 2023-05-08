//
//  DestinationViewController.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 02/05/23.
//

import UIKit
import SwiftUI

class TripNameViewController: UIViewController {

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
        //        let attributes = [NSAttributedString.Key.font: UIFont(name: "Poppins Regular", size: 17)!]
        //        UINavigationBar.appearance().titleTextAttributes = attributes
        self.title = S.appName
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)


        let hostingController = UIHostingController(
            rootView: TripNameFormUI(viewModel: viewModel, viewController: self))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view)
        }
        hostingController.didMove(toParent: self)


    }

    func navigateToDate() {
        let nextNavigation = TripDateViewController(viewModel: viewModel)
        navigationController?.pushViewController(nextNavigation, animated: true)

    }


    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
