////
////  ScrapPageViewModel.swift
////  Memoria
////
////  Created by Winxen Ryandiharvin on 03/05/23.
////
//
// import Foundation
// import Combine
//
// class ScrapPageViewModel: ObservableObject {
//
//    private let createScrapPage: AnyUseCase<ScrapPage, Failure>
//    private let getScrapPages: AnyUseCase<[ScrapPage], Failure>
//    private let editScrapPage: AnyUseCase<ScrapPage, Failure>
//    private let deleteScrapPage: AnyUseCase<ScrapPage, Failure>
//    private var cancellables: Set<AnyCancellable>
//
//    //Q: perlu panggil si initial ka?
////    @Published private(set) var state = ScrapPage.initial()
//
//    init(createScrapPage: AnyUseCase<ScrapPage, Failure>, getScrapPages: AnyUseCase<[ScrapPage], Failure>, editScrapPage: AnyUseCase<ScrapPage, Failure>, deleteScrapPage: AnyUseCase<ScrapPage, Failure>, cancellables: Set<AnyCancellable>) {
//        self.createScrapPage = createScrapPage
//        self.getScrapPages = getScrapPages
//        self.editScrapPage = editScrapPage
//        self.deleteScrapPage = deleteScrapPage
//        self.cancellables = cancellables
//    }
//    func loadProcess(intent: ScrapPageIntent) {
//        switch intent {
//        case .getScrapPages: getScrapPages()
//        }
//    }
// }
//
// enum ScrapPageStatus {
//    case initial
//    case loading
//    case successGetScrapPage([ScrapPage])
//    case successScrapPage(ScrapPage)
//    case failed(Failure)
// }
//
// enum ScrapPageIntent {
//    case getScrapPages
// }
