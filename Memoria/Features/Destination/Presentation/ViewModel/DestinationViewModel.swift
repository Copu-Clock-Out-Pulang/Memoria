//
//  DestinationViewModel.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 02/05/23.
//

import Foundation
import UIKit
import Combine

class DestinationViewModel: ObservableObject {

    // MARK: - Attributes
    @Published private(set) var tripName: String?
    @Published private(set) var tripStartDate: Date?
    @Published private(set) var tripEndDate: Date?
    @Published private(set) var quote: String?
    @Published private(set) var familyPhoto: UIImage?
    @Published private(set) var selectedArea: Area?
    @Published private(set) var areas: [Area] = []
    @Published private(set) var recommendations: [Recommendation] = []
    @Published private(set) var selectedRecommendation: [Recommendation: Bool] = [:]
    @Published private(set) var status: DestinationStatus = .initial
    
    @Published private(set) var createdScrapBook: ScrapBook?

    // MARK: - Cancellables
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Usecases
    private let getTripArea: AnyUseCase<[Area], NoParams>
    private let getDestinations: AnyUseCase<[Destination], GetTripDestinationByAreaParams>
    private let generateRecommendations: AnyUseCase<[Recommendation], GenerateRecommendationParams>
    private let createScrapBook: AnyUseCase<ScrapBook, CreateScrapBookParams>
    
    // MARK: - Initializers
    init(getTripArea: AnyUseCase<[Area], NoParams>, getDestinations: AnyUseCase<[Destination], GetTripDestinationByAreaParams>, generateRecommendations: AnyUseCase<[Recommendation], GenerateRecommendationParams>, createScrapBook: AnyUseCase<ScrapBook, CreateScrapBookParams>) {
        self.getTripArea = getTripArea
        self.getDestinations = getDestinations
        self.generateRecommendations = generateRecommendations
        self.createScrapBook = createScrapBook

    }


    // MARK: - Actions
    func changeTripName(name: String) {
        self.tripName = name
    }

    func changeQuote(quote: String) {
        self.quote = quote
    }

    func changeStartEndDate(startDate: Date, endDate: Date) {
        self.tripStartDate = startDate
        self.tripEndDate = endDate
    }

    func changeFamilyPhoto(familyPhoto: UIImage) {
        self.familyPhoto = familyPhoto
    }

    func selectArea(area: Area) {
        self.selectedArea = area
    }

    func fetchDestinations() {
        guard let selected = self.selectedArea,
              let family = self.familyPhoto else {
            return
        }
        status = .loading
        getDestinations.execute(params: GetTripDestinationByAreaParams(area: selected))
            .flatMap { destinations in
                self.generateRecommendations
                    .execute(params: GenerateRecommendationParams(destinations: destinations, familyPhoto: family))

            }
            .sink(receiveCompletion: {[weak self] completion in
                switch completion {
                case .finished:
                    self?.status = .success
                case .failure(let failure):
                    self?.status = .failure(failure: failure)
                }
            }, receiveValue: {recs in
                self.recommendations = recs
                recs.forEach { recommendation in
                    self.selectedRecommendation[recommendation] = false
                }
            })
            .store(in: &cancellables)

        status = .initial
    }
    func selectRecommendation(recommendation: Recommendation) {
        self.selectedRecommendation[recommendation] = true
    }
    func unselectRecommendation(recommendation: Recommendation) {
        self.selectedRecommendation[recommendation] = false
    }


    func fetchAreas() {
        status = .loading
        getTripArea.execute(params: NoParams())
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.status = .success
                case .failure(let failure):
                    self?.status = .failure(failure: failure)
                }
            }, receiveValue: {[weak self] areas in
                self?.areas = areas
            })
            .store(in: &cancellables)
        status = .initial
    }

    func createScrapbook() {
        self.status = .createScrapbookLoading
        let selected = selectedRecommendation.filter {
            $0.value == true
        }.keys
        let scrapPages = selected
            .map {
                ScrapPage(id: UUID(), name: $0.destination.name, thumbnail: $0.generatedPhoto.pngData()?.base64EncodedString() ?? "", content: ScrapPageContent.initialContent(image: $0.generatedPhoto), createdAt: Date.now, updatedAt: Date.now)
                
            }
        
        createScrapBook.execute(params: CreateScrapBookParams(form: CreateScrapBookForm(name: self.tripName ?? "", quote: self.quote ?? "", scrapPages: scrapPages, selectedRecommendations: Array(selected), startDate: Date.now, endDate: Date.now)))
            .sink(receiveCompletion: {[weak self] completion in
                switch completion {
                case .finished:
                    self?.status = .createScrapbookSuccess
                case .failure(let failure):
                    self?.status = .failure(failure: failure)
                }
            }, receiveValue: { scrapBook in
                self.createdScrapBook = scrapBook
            })
            .store(in: &cancellables)
    }
}

extension DestinationViewModel {

//    func validateTripName(name: String) -> Bool {
//
//    }
}

enum DestinationStatus {
    case initial
    case loading
    case success
    case failure(failure: Failure)
    case invalidName
    case selectRecommendation
    case createScrapbookSuccess
    case createScrapbookLoading
}
