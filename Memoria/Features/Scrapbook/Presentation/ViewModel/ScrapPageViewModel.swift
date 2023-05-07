//
//  ScrapPageViewModel.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 03/05/23.
//

import Foundation
import Combine

class ScrapPageViewModel: ObservableObject {
    // MARK: - Attributes
    @Published private(set) var scrapPage: ScrapPage?
    @Published private(set) var status: ScrapPageStatus = .initial

    // MARK: - Usecases
    private let createScrapPage: AnyUseCase<ScrapPage, CreateScrapPageParams>
    private let getScrapPages: AnyUseCase<[ScrapPage], NoParams>
    private let editScrapPage: AnyUseCase<ScrapPage, EditScrapPageParams>
    private let deleteScrapPage: AnyUseCase<Void, DeleteScrapPageParams>

    // MARK: - Cancellables
    private var cancellables = Set<AnyCancellable>()

    init(createScrapPage: AnyUseCase<ScrapPage, CreateScrapPageParams>, getScrapPages: AnyUseCase<[ScrapPage], NoParams>, editScrapPage: AnyUseCase<ScrapPage, EditScrapPageParams>, deleteScrapPage: AnyUseCase<Void, DeleteScrapPageParams>) {
        self.createScrapPage = createScrapPage
        self.getScrapPages = getScrapPages
        self.editScrapPage = editScrapPage
        self.deleteScrapPage = deleteScrapPage
    }

    func loadScrapPages() {
        status = .loading
        getScrapPages.execute(params: NoParams())
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    break
                }
            }, receiveValue: {scrappage in
                self.scrapPage = scrappage.first
            }).store(in: &cancellables)
    }

    func saveScrapPage(name: String, thumbnail: String, content: String) {
        editScrapPage.execute(params: EditScrapPageParams(scrapPage: scrapPage!, form: EditScrapPageForm(name: name, thumbnail: thumbnail, content: content)))
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    break
                }
            }, receiveValue: {
                scrappage in
                self.scrapPage = scrappage
                self.loadScrapPages()
            }).store(in: &cancellables)
    }
    func addScrapPage(form: CreateScrapPageForm) {
        createScrapPage.execute(params: CreateScrapPageParams(form: form))
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    break
                }
            }, receiveValue: {
                scrappage in
                self.scrapPage = scrappage
                self.loadScrapPages()
            }).store(in: &cancellables)
    }

    func deleteScrapPage(scrapPage: ScrapPage) {
        deleteScrapPage.execute(params: DeleteScrapPageParams(scrapPage: scrapPage))
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    break
                }
            }, receiveValue: {
                self.loadScrapPages()
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
