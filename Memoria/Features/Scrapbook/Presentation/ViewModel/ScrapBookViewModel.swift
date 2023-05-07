//
//  ScrapBookViewModel.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 06/05/23.
//

import Foundation
import Combine

class ScrapBookViewModel: ObservableObject {

    // MARK: - Attributes
    @Published private(set) var scrapBook: ScrapBook?
    @Published private(set) var selectedScrapPage: ScrapPage?
    @Published private(set) var status: ScrapBookStatus = .initial

    // MARK: - Usecases
    private let createScrapBook: AnyUseCase<ScrapBook, CreateScrapBookParams>
    private let getScrapBooks: AnyUseCase<[ScrapBook], NoParams>
    private let editScrapBook: AnyUseCase<ScrapBook, EditScrapBookParams>
    private let deleteScrapBook: AnyUseCase<Void, DeleteScrapBookParams>

    // MARK: - Cancellables
    private var cancellables = Set<AnyCancellable>()

    init(createScrapBook: AnyUseCase<ScrapBook, CreateScrapBookParams>, getScrapBooks: AnyUseCase<[ScrapBook], NoParams>, editScrapBook: AnyUseCase<ScrapBook, EditScrapBookParams>, deleteScrapBook: AnyUseCase<Void, DeleteScrapBookParams>) {
        self.createScrapBook = createScrapBook
        self.getScrapBooks = getScrapBooks
        self.editScrapBook = editScrapBook
        self.deleteScrapBook = deleteScrapBook
    }

    func setSelectedScrapPage(scrapPage: ScrapPage){
        self.selectedScrapPage = scrapPage
    }
    
    func loadScrapBooks() {
        status = .loading
        getScrapBooks.execute(params: NoParams())
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    break
                }
            }, receiveValue: {scrapbook in
                self.scrapBook = scrapbook.first
            }).store(in: &cancellables)
    }

    func addScrapBook(form: CreateScrapBookForm) {
        createScrapBook.execute(params: CreateScrapBookParams(form: form))
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    break
                }
            }, receiveValue: {scrapbook in
                self.scrapBook = scrapbook
                self.loadScrapBooks()
            }).store(in: &cancellables)
    }

    func updateScrapBook(scrapBook: ScrapBook, form: EditScrapBookForm) {
        editScrapBook.execute(params: EditScrapBookParams(scrapBook: scrapBook, form: form))
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    break
                }
            }, receiveValue: {scrapbook in
                self.scrapBook = scrapbook
                self.loadScrapBooks()
            }).store(in: &cancellables)
    }

    func removeScrapBook(scrapBook: ScrapBook) {
        deleteScrapBook.execute(params: DeleteScrapBookParams(scrapBook: scrapBook))
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    break
                case .failure(let failure):
                    break
                }
            }, receiveValue: {
                self.loadScrapBooks()
            }).store(in: &cancellables)
    }
}

enum ScrapBookStatus {
    case initial
    case loading
    case successGetScrapBook([ScrapBook])
    case successCreateScrapBook(ScrapBook)
    case successDeleteScrapBook
    case failed(Failure)
}

enum ScrapBookIntent {
    case getScrapBooks
}
