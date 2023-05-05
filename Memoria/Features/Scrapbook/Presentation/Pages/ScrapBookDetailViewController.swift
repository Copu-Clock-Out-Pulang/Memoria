//
//  ScrapBookDetailViewController.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 03/05/23.
//

import UIKit
import SwiftUI
import SnapKit
import Combine

class ScrapBookDetailViewController: UIViewController, ObservableObject {

    private let scrapBookTitle = "Page Title"
    private var cancellables = Set<AnyCancellable>()
    private let scrapPageViewModel = InjectionContainer.shared.container.resolve(ScrapPageViewModel.self)!
    private let scrapBookViewModel = InjectionContainer.shared.container.resolve(ScrapBookViewModel.self)!

    //    let getScrapBook = InjectionContainer.shared.container.resolve(AnyUseCase<[ScrapBook], NoParams>.self, name: "GetScrapBook")

    func navigateToScrapPageEditor() {
        navigationController?.pushViewController(ScrapbookEditorViewController(scrapPageName: "", scrapPageContent: "", scrapPageThumbnail: "", viewModel: scrapPageViewModel), animated: true)
    }

    @Published var scrapBook: ScrapBook?

    override func viewDidLoad() {
        super.viewDidLoad()

        //        createScrapBook?.execute(params: CreateScrapBookParams(form: CreateScrapBookForm(user: User(id: UUID(), name: "Duar"), name: "ScrapBookDummy", quote: "Jalan jalan ke kota baru", scrapPages: [ScrapPage(id: UUID(), name: "Duar", thumbnail: "", content: "", createdAt: Date.now, updatedAt: Date.now)], selectedRecommendations: [], startDate: Date.now, endDate: Date.now)))
        //            .sink(receiveCompletion: {completion in
        //                switch completion {
        //                case .finished:
        //                    break
        //                case .failure(let failure):
        //                    break
        //                }
        //            }, receiveValue: {[weak self] scrapbook in
        //                self?.scrapBook = scrapbook
        //            }).store(in: &cancellables)

        //        getScrapBook?.execute(params: NoParams())
        //            .sink(receiveCompletion: {completion in
        //            switch completion {
        //            case .finished:
        //                break
        //            case .failure(let failure):
        //                break
        //            }
        //        }, receiveValue: {[weak self] scrapbook in
        //            self?.scrapBook = scrapbook.first
        //        }).store(in: &cancellables)

        scrapBookViewModel.loadScrapBooks()
        scrapPageViewModel.loadScrapPages()

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Poppins-Bold", size: 22)!]

        self.title = scrapBookTitle

        let rootView = ScrapBookDetailView(controller: self, scrapBookViewModel: scrapBookViewModel, scrapPageViewModel: scrapPageViewModel)

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
