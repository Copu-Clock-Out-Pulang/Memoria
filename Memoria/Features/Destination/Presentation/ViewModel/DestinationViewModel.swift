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

    // MARK: - Cancellables
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Usecases
    private let getTripArea: AnyUseCase<[Area], NoParams>
    private let getDestinations: AnyUseCase<[Destination], GetTripDestinationByAreaParams>
    private let generateRecommendations: AnyUseCase<[Recommendation], GenerateRecommendationParams>
    // MARK: - Initializers
    init(getTripArea: AnyUseCase<[Area], NoParams>, getDestinations: AnyUseCase<[Destination], GetTripDestinationByAreaParams>, generateRecommendations: AnyUseCase<[Recommendation], GenerateRecommendationParams>) {
        self.getTripArea = getTripArea
        self.getDestinations = getDestinations
        self.generateRecommendations = generateRecommendations

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
            }, receiveValue: {recommendations in
                self.recommendations = recommendations
                recommendations.forEach { recommendation in
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
        // TODO: sesuaikan dengan usecase winxen
//        let scrapPage = selectedRecommendation.filter {
//            $0.value == true
//        }
//            .keys.map {
//                ScrapPage(id: UUID(), name: $0.destination.name, thumbnail: .dest, content: <#T##String#>, createdAt: <#T##Date#>, updatedAt: <#T##Date#>)
//            }
//
//        let scrapbook = ScrapBook(
//            id: UUID(),
//            user: User(id: UUID(), name: "User"),
//            destinations: selectedRecommendation.keys.map {$0.destination},
//            scrapPages: [],
//            quote: <#T##String#>,
//            name: <#T##String#>,
//            startDate: <#T##Date?#>,
//            endDate: <#T##Date?#>,
//            createdAt: <#T##Date#>,
//            updatedAt: <#T##Date#>)
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
}
