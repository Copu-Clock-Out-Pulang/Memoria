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
    private let scrapBookEditorViewModel = ScrapBookEditorViewModel()
    
    func addScrapPage() {
        scrapPageViewModel.addScrapPage(form: CreateScrapPageForm(
            id: UUID(),
            name: "New Scrap Book",
            thumbnail: "",
            content: scrapBookEditorViewModel.makeEmptyContent(),
            createdAt: Date.now,
            updatedAt: Date.now,
            scrapBook: scrapBookViewModel.scrapBook!
        )
        )
    }
    
    func selectScrapPage(scrapPage: ScrapPage){
        scrapBookViewModel.setSelectedScrapPage(scrapPage: scrapPage)
    }
    
    func getSelectedPage() -> ScrapPage {
        return scrapBookViewModel.selectedScrapPage!
    }
    
    func formatDateRange(start: Date, end: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"

        let startDateString = dateFormatter.string(from: start)
        let endDateString = dateFormatter.string(from: end)

        let year = Calendar.current.component(.year, from: start)

        if Calendar.current.isDate(start, equalTo: end, toGranularity: .day) {
            return "\(startDateString) \(year)"
        } else if Calendar.current.isDate(start, equalTo: end, toGranularity: .month) {
            return "\(startDateString) - \(endDateString) \(year)"
        } else {
            let monthFormatter = DateFormatter()
            monthFormatter.dateFormat = "MMM"

            let startMonthString = monthFormatter.string(from: start)
            let endMonthString = monthFormatter.string(from: end)

            return "\(startDateString) \(startMonthString) - \(endDateString) \(endMonthString) \(year)"
        }
    }


    func navigateToScrapPageEditor(scrapPage: ScrapPage) {
        navigationController?.pushViewController(ScrapbookEditorViewController(
                                                    scrapPageName: scrapPage.name,
                                                    scrapPageContent: scrapPage.content,
                                                    scrapPageThumbnail: scrapPage.thumbnail,
                                                    viewModel: scrapPageViewModel),
                                                 animated: true)
    }

    @Published var scrapBook: ScrapBook?

    override func viewDidLoad() {
        super.viewDidLoad()

        // delete this function in final code
        scrapBookViewModel.addScrapBook(
            form: CreateScrapBookForm(
                name: "Green Office Park",
                quote: "Jalan Jalan ke Kota Hijau",
                scrapPages: [],
                selectedRecommendations: [],
                startDate: Date.now,
                endDate: Date.now))
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
