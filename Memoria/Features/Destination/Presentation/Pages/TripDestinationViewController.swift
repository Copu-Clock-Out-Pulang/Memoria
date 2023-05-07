//
//  TripDestinationViewController.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 06/05/23.
//

import UIKit
import SwiftUI

class TripDestinationViewController: UIViewController {

    
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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.createScrapBook))


        let hostingController = UIHostingController(rootView: TripDestinationUI(viewModel: viewModel, viewController: self))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view)
        }
        hostingController.didMove(toParent: self)
        
        viewModel.fetchDestinations()
        
    }
    
    @objc func createScrapBook() {
        print("clicked")
        viewModel.createScrapbook()
    }
    
    func navigateToScrapBookDetail() {
        let scrapBookDetail = ScrapBookDetailViewController()
        let home = HomeViewController()
        navigationController?.setViewControllers([home, scrapBookDetail], animated: true)
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
