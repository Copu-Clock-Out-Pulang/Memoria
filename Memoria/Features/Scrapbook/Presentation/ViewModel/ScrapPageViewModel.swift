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
    @Published private(set) var scrapBook: ScrapBook?
    private(set) var scrapPageBuffer: ScrapPage?
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
                self.scrapPage = scrappage.first(where: {
                    element in
                    element.id == self.scrapPageBuffer!.id
                })
            }).store(in: &cancellables)
    }

    func setScrapPage(scrapPage:ScrapPage){
        self.scrapPageBuffer = scrapPage
    }
    
    func changeSelectedScrapPage(scrapPage: ScrapPage) {
        self.scrapPage = scrapPage
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.loadScrapPages()
                }
            }).store(in: &cancellables)
    }

    func deleteScrapPage(scrapPage: ScrapPage, nextScrapPage: ScrapPage) {
        deleteScrapPage.execute(params: DeleteScrapPageParams(scrapPage: scrapPage))
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    break
                }
            }, receiveValue: {
                self.scrapPageBuffer = nextScrapPage
                self.loadScrapPages()
                self.changeSelectedScrapPage(scrapPage: nextScrapPage)
                print(self.scrapPage?.name)
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
