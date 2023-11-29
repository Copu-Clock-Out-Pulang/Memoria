//
//  SplashViewController.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 19/04/23.
//

import UIKit
import SwiftUI

class SplashViewController: UIViewController {

    // Migration starts here (LightWeight)

    // below are the codes for debugging purpose

    //    let destination1 = DestinationCoreDataModel(
    //        id: UUID(),
    //        name: "Eiffel Tower",
    //        photo: "eiffel_tower.jpg",
    //        address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France",
    //        latitude: 48.8584,
    //        longitude: 2.2945,
    //        ticketPrice: "€16",
    //        website: "https://www.toureiffel.paris/en",
    //        instagram: "@toureiffel",
    //    description: "asdadasd"
    //    )
    //
    //    let destination2 = DestinationCoreDataModel(
    //        id: UUID(),
    //        name: "Statue of Liberty",
    //        photo: "statue_of_liberty.jpg",
    //        address: "New York, NY 10004, United States",
    //        latitude: 40.6892,
    //        longitude: -74.0445,
    //        ticketPrice: "$18.50",
    //        website: "https://www.nps.gov/stli/index.htm",
    //        instagram: "@statueoflibertynyc",
    //    description: "asdkaskdaksd"
    //    )
    //
    //    let destination3 = DestinationCoreDataModel(
    //        id: UUID(),
    //        name: "Great Wall of China",
    //        photo: "great_wall_of_china.jpg",
    //        address: "Huairou District, China, 101405",
    //        latitude: 40.4319,
    //        longitude: 116.5704,
    //        ticketPrice: "¥35",
    //        website: "https://www.chinahighlights.com/greatwall/",
    //        instagram: "@greatwallofchina",
    //    description: "adalsdladl"
    //    )


    //    let migration = DestinationMigration()

    let viewModel: SplashViewModel

    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        let hostingController = UIHostingController(rootView: SplashViewUI(viewModel: viewModel, controller: self))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view)
        }
        hostingController.didMove(toParent: self)

        viewModel.startAreaMigration()

        //        //     Create the first destination
        //        let destination1CD = migration.createDestination(from: destination1)
        //        if destination1CD != nil {
        //            print("Successfully created destination with id \(destination1CD!.id)")
        //        }
        //        // Create the second destination
        //        let destination2CD = migration.createDestination(from: destination2)
        //        if destination2CD != nil {
        //            print("Successfully created destination with id \(destination2CD!.id)")
        //        }
        //        // Create the third destination
        //        let destination3CD = migration.createDestination(from: destination3)
        //        if destination3CD != nil {
        //            print("Successfully created destination with id \(destination3CD!.id)")
        //        }

    }

    func navigateToNextPage() {
        let isFirst = viewModel.isOnBoardingDisplayed

        if !isFirst {
            self.navigateToOnboarding()
        } else {
            self.navigateToHomeScreen()
        }
    }

    private func navigateToOnboarding() {
        navigationController?.setViewControllers([FirstOnBoardingViewController()], animated: true)
    }

    private func navigateToHomeScreen() {
        // TODO: Change to real HomeScreen
        let destinationViewModel = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        let homeScreen = HomeViewController()
        navigationController?.setViewControllers([homeScreen], animated: true)

    }
}
