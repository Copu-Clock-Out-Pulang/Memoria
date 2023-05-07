//
//  DestinationViewController.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 02/05/23.
//

import UIKit

class DestinationViewController: UIViewController {

    private lazy var contentView = TripNameFromView()
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

        // Do any additional setup after loading the view.

    }

    override func loadView() {
        view = contentView
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
