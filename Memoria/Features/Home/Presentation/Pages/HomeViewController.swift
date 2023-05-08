//
//  HomeViewController.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 19/04/23.
//

import UIKit
import SwiftUI

public class HomeViewController: UIViewController, ObservableObject {

    private let scrapBookViewModel = InjectionContainer.shared.container.resolve(ScrapBookViewModel.self)!
    
//    @Published var scrapBooks: [ScrapBook]?
    
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

    
    func getScrapBookInfo(scrapBooksData: [ScrapBook]) -> [(name: String, date: String, quote: String, thumbnail: String, scrapBook: ScrapBook)] {
        var result = [(name: String, date: String, quote: String, thumbnail: String, scrapBook: ScrapBook)]()
        for scrapBook in scrapBooksData {
            let info = (name: scrapBook.name, date: formatDateRange(start: scrapBook.startDate ?? Date.now, end: scrapBook.endDate ?? Date.now), quote: scrapBook.quote, thumbnail: scrapBook.scrapPages.first?.thumbnail ?? I.scrapPageThumbnailNew.image(compatibleWith: .current).pngData()!.base64EncodedString(), scrapBook: scrapBook)
            result.append(info)
        }
        return result
    }
    
    func generateDummyScrapBook(){
//        scrapBookViewModel.addScrapBook(form: CreateScrapBookForm(
//            name: "Hi",
//            quote: "Test",
//            scrapPages: [
//                ScrapPage(id: UUID(), name: "Hi", thumbnail: UIImage(named: "Monas")?.pngData()?.base64EncodedString()!, content: UIImage(named: "Monas")?.pngData()?.base64EncodedString()!, createdAt: Date.now, updatedAt: Date.now)
//            ],
//            selectedRecommendations: [],
//            startDate: Date.now,
//            endDate: Date.now))
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        navigationController?.toolbar.backgroundColor = .clear
        view.backgroundColor = .systemBlue
        
        // Delete this in production code
//        generateDummyScrapBook()
        
        scrapBookViewModel.loadAllScrapBooks()
        //DUMBEST WAY TO DO IT TAPI KITA NGINJECT DATA DENGAN CARA ANAK BODO
        
        //MARK: BRING SWIFTUI TO UIKIT
        
        
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
 
        self.title = S.appName
        self.navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(self.navigateToTrip)), animated: true)
        
        let hostingController = UIHostingController(
            rootView: HomeViewUI(
            controller: self, scrapBookViewModel: scrapBookViewModel))
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(view)
        }
        hostingController.didMove(toParent: self)

    }
    
   @objc func navigateToTrip() {
        let vm = InjectionContainer.shared.container.resolve(DestinationViewModel.self)!
        navigationController?.pushViewController(TripNameViewController(viewModel: vm), animated: true)
    }
    
    func navigateToScrapBook(scrapBook: ScrapBook) {
        navigationController?.pushViewController(ScrapBookDetailViewController(scrapBook: scrapBook), animated: true)
    }
    
}
