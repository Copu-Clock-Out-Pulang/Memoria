//
//  DestinationMigration.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 25/04/23.
//

import CoreData

class DestinationMigration {

    let context: NSManagedObjectContext
    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func saveDestination() {
        do {
            try context.save()
        } catch let error as NSError {
            print("Error saving context: \(error.localizedDescription)")
        }
    }

    func createDestination(from model: DestinationCoreDataModel) -> DestinationCoreDataModel? {
        let destination = NSEntityDescription.insertNewObject(
            forEntityName: "DestinationCoreDataModel",
            into: context) as? DestinationCoreDataModel
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

    func getAllDestinations() -> [DestinationCoreDataModel]? {
        let fetchRequest: NSFetchRequest<DestinationCoreDataModel> = DestinationCoreDataModel.fetchRequest()
        do {
            //            let destinations = try context.fetch(fetchRequest)
            //            let destinationModels = destinations.compactMap { $0.toModel() }
            //            return destinationModels

            let destinations = try context.fetch(fetchRequest)
            return destinations

        } catch let error as NSError {
            print("Error fetching destinations: \(error.localizedDescription)")
            return nil
        }
    }

    func updateDestination(_ destination: DestinationCoreDataModel, with model: DestinationCoreDataModel) {
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

    func deleteDestination(_ destinationModel: DestinationCoreDataModel) {
        let fetchRequest: NSFetchRequest<DestinationCoreDataModel> = DestinationCoreDataModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", destinationModel.id! as CVarArg)
        do {
            let results = try context.fetch(fetchRequest)
            guard let destination = results.first else { return }
            context.delete(destination)
            saveDestination()
        } catch let error as NSError {
            print("Error deleting destination: \(error.localizedDescription)")
        }
    }
}
