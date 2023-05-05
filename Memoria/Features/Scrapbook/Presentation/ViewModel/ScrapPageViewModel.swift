//
//  ScrapPageViewModel.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 03/05/23.
//

 import Foundation
 import Combine

 class ScrapPageViewModel {

    // MARK: - Attributes
     @Published private(set) var scrapPageId: UUID
     @Published private(set) var scrapPageName: String?
     @Published private(set) var scrapPageThumbnail: String?
     @Published private(set) var scrapPageContent: String?
     @Published private(set) var scrapBook: ScrapBook?
     @Published private(set) var createdAt: Date
     @Published private(set) var updatedAt: Date
     @Published private(set) var status: ScrapPageStatus = .initial
     
    // MARK: - Usecases
    private let createScrapPage: AnyUseCase<ScrapPage, CreateScrapPageParams>
    private let getScrapPages: AnyUseCase<[ScrapPage], Failure>
    private let editScrapPage: AnyUseCase<ScrapPage, Failure>
    private let deleteScrapPage: AnyUseCase<ScrapPage, Failure>
     
    // MARK: - Cancellables
    private var cancellables: Set<AnyCancellable>

     init(createScrapPage: AnyUseCase<ScrapPage, Failure>, getScrapPages: AnyUseCase<[ScrapPage], Failure>, editScrapPage: AnyUseCase<ScrapPage, Failure>, deleteScrapPage: AnyUseCase<ScrapPage, Failure>) {
         self.createScrapPage = createScrapPage
         self.getScrapPages = getScrapPages
         self.editScrapPage = editScrapPage
         self.deleteScrapPage = deleteScrapPage
     }
    
    func loadProcess() {
        status = .loading
        getScrapBook?.execute(params: NoParams())
            .sink(receiveCompletion: {completion in
            switch completion {
            case .finished:
                break
            case .failure(let failure):
                break
            }
        }, receiveValue: {[weak self] scrapbook in
            self?.scrapBook = scrapbook.first
        }).store(in: &cancellables)
    }
}
 

 enum ScrapPageStatus {
    case initial
    case loading
    case successGetScrapPage([ScrapPage])
    case successCreateScrapPage(ScrapPage)
    case successDeleteScrapPage
    case failed(Failure)
 }

 enum ScrapPageIntent {
    case getScrapPages
 }
