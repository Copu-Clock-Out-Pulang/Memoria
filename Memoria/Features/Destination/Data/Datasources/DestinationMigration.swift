//
//  DestinationMigration.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 25/04/23.
//

import CoreData

class DestinationMigration {
    
    let persistentContainer = PersistenceController()
    
    func saveDestination() {
        do {
            try persistentContainer.container.viewContext.save()
        } catch let error as NSError {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
    
    func createDestination(from model: DestinationModel) -> DestinationCoreDataModel? {
        let destination = NSEntityDescription.insertNewObject(
            forEntityName: "DestinationCoreDataModel",
            into: persistentContainer.container.viewContext) as? DestinationCoreDataModel
        destination?.id = model.id
        destination?.name = model.name
        destination?.photo = model.photo
        destination?.address = model.address
        destination?.latitude = model.latitude
        destination?.longitude = model.longitude
        destination?.ticketPrice = model.ticketPrice
        destination?.website = model.website
        destination?.instagram = model.instagram
        saveDestination()
        return destination
    }
    
    func getAllDestinations() -> [DestinationModel]? {
        let fetchRequest: NSFetchRequest<DestinationCoreDataModel> = DestinationCoreDataModel.fetchRequest()
        do {
            let destinations = try persistentContainer.container.viewContext.fetch(fetchRequest)
            let destinationModels = destinations.compactMap { $0.toModel() }
            return destinationModels
        } catch let error as NSError {
            print("Error fetching destinations: \(error.localizedDescription)")
            return nil
        }
    }
    
    func updateDestination(_ destination: DestinationCoreDataModel, with model: DestinationModel) {
        destination.id = model.id
        destination.name = model.name
        destination.photo = model.photo
        destination.address = model.address
        destination.latitude = model.latitude
        destination.longitude = model.longitude
        destination.ticketPrice = model.ticketPrice
        destination.website = model.website
        destination.instagram = model.instagram
        saveDestination()
    }
    
    func deleteDestination(_ destinationModel: DestinationModel) {
        let fetchRequest: NSFetchRequest<DestinationCoreDataModel> = DestinationCoreDataModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", destinationModel.id as CVarArg)
        do {
            let results = try persistentContainer.container.viewContext.fetch(fetchRequest)
            guard let destination = results.first else { return }
            persistentContainer.container.viewContext.delete(destination)
            saveDestination()
        } catch let error as NSError {
            print("Error deleting destination: \(error.localizedDescription)")
        }
    }
}
