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

    @Published var index: Int?
    @Published var scrapBook: ScrapBook?
    @Published var scrapPage: ScrapPage?
    
    init(scrapBook: ScrapBook) {
        super.init(nibName: nil, bundle: nil)
        self.scrapBook = scrapBook
        scrapBookViewModel.setScrapBook(scrapBook: scrapBook)
        scrapPageViewModel.setScrapPage(scrapPage: scrapBook.scrapPages.first!
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addScrapPage() -> ScrapPage {
        let thumbnail = I.scrapPageThumbnailNew.image(compatibleWith: .current).pngData()!.base64EncodedString()
        scrapPageViewModel.addScrapPage(form: CreateScrapPageForm(
            id: UUID(),
            name: "New Scrap Page",
            thumbnail: thumbnail,
            content: scrapBookEditorViewModel.makeEmptyContent(),
            createdAt: Date.now,
            updatedAt: Date.now,
            scrapBook: scrapBookViewModel.scrapBook!
        )
        )
        return scrapPageViewModel.scrapPage!
    }

    func deleteScrapPage(scrapPage: ScrapPage) {
        scrapPageViewModel.deleteScrapPage(scrapPage: scrapPage)
    }

    func selectScrapPage(scrapPage: ScrapPage) {
        scrapBookViewModel.setSelectedScrapPage(scrapPage: scrapPage)
    }
    
    func setScrapBook(scrapBook: ScrapBook){
        self.scrapBook = scrapBook
    }

    func getScrapBookInfo() -> ScrapBookInfo {
        return ScrapBookInfo(name: scrapBookViewModel.scrapBook!.name, tripDate: formatDateRange(start: scrapBookViewModel.scrapBook!.startDate ?? Date.now, end: scrapBookViewModel.scrapBook!.endDate ?? Date.now), tripDescription: scrapBookViewModel.scrapBook!.quote)
    }

    func getScrapBook() -> ScrapBook {
        return scrapBookViewModel.scrapBook!
    }

    func updateScrapBook(scrapBook: ScrapBook, tripName: String, tripDescription: String, startDate: Date?, endDate: Date?) {
        scrapBookViewModel.updateScrapBook(scrapBook: scrapBook, form: EditScrapBookForm(name: tripName, scrapPage: scrapBook.scrapPages, quote: tripDescription, startDate: startDate, endDate: endDate)
        )
    }

    func formatDateRange(start: Date, end: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        if start == nil && end == nil {
            return "27 Jan - 3 Feb 2023"
        }
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
        navigationController?.pushViewController(
            ScrapbookEditorViewController(
                scrapPageName: scrapPage.name,
                scrapPageContent: scrapPage.content,
                scrapPageThumbnail: scrapPage.thumbnail,
                viewModel: scrapPageViewModel),
            animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.toolbar.backgroundColor = .clear
//        scrapBookViewModel.loadScrapBooks()
//
//        if scrapBook == nil {
//            scrapBookViewModel.addScrapBook(
//                form: CreateScrapBookForm(
//                    name: "Green Office Park",
//                    quote: "Jalan Jalan ke Kota Hijau",
//                    scrapPages: [],
//                    selectedRecommendations: [],
//                    startDate: Date.now,
//                    endDate: Date.now))
//        }
        scrapBookViewModel.loadScrapBooks()
        scrapPageViewModel.loadScrapPages()
        scrapPage = scrapBook?.scrapPages.first
//        if scrapPage == nil {
//            scrapPageViewModel.addScrapPage(form: CreateScrapPageForm(
//                                                id: UUID(),
//                                                name: "New Scrap Page",
//                                                thumbnail: "",
//                                                content: scrapBookEditorViewModel.makeEmptyContent(),
//                                                createdAt: Date.now,
//                                                updatedAt: Date.now,
//                                                scrapBook: scrapBook!))
//        }
//        scrapPageViewModel.loadScrapPages()
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

struct ScrapBookInfo {
    var name: String
    var tripDate: String
    var tripDescription: String
}
