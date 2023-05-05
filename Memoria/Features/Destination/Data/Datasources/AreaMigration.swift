//
//  AreaMigration.swift
//  Memoria
//
//  Created by Adryan Eka Vandra on 05/05/23.
//

import Foundation
import Combine
import CoreData

protocol AreaMigration {
    
    func addArea() -> AnyPublisher<Void, Failure>
//    func deleteArea() -> AnyPublisher<Void, Failure>
}
class AreaMigrationImpl: AreaMigration {
    
    private let context: NSManagedObjectContext
    
    private lazy var areas: [Area] = {
       return [
        generateArea(name: "Jakarta", province: "DKI Jakarta", description: "The Capital of Republic Indonesia", image: "Jakarta"),
        generateArea(name: "Bogor", province: "West Java", description: "The City of Rain", image: "Bogor"),
        generateArea(name: "Depok", province: "West Java", description: "The City of Star Fruit", image: "Depok"),
        generateArea(name: "Tangerang", province: "Banten", description: "The City of Fotress", image: "Tangerang"),
        generateArea(name: "Bekasi", province: "West Java", description: "The City of Patriot", image: "Bekasi")
       ]
    }()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func addArea() -> AnyPublisher<Void, Failure> {
        for area in areas {
            let newArea = NSEntityDescription.insertNewObject(forEntityName: "AreaCoreDataModel", into: context)
            newArea.setValue(UUID(), forKey: "id")
            newArea.setValue(area.name, forKey: "name")
            newArea.setValue(area.description, forKey: "descriptions")
            newArea.setValue(area.province, forKey: "province")
            newArea.setValue(area.image, forKey: "image")

        }
        do {
            try context.save()

            return Just(()).setFailureType(to: Failure.self)
            .eraseToAnyPublisher()        } catch {
            print(error)
                return Fail(error: Failure.areaMigrationFailure).eraseToAnyPublisher()
        }
    }
    
//    func deleteArea() -> AnyPublisher<Void, Failure> {
//        do {
//
//        }
//    }
    
    
    private func generateArea(name: String, province: String, description: String, image: String) -> Area {
        let area = Area(
        id: UUID(), name: name, province: province, description: description, image: image
        )
//        area.name = name
//        area.descriptions = description
//        area.image = image
        return area
    }
    
}
