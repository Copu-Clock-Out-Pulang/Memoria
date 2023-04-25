//
//  DestinationMigration.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 25/04/23.
//

import Foundation
import CoreData

class DestinationMigration{
    //alternative way to get NSFetchRequest atau NSAsynchronousFetchResult, instead of using SwiftUI (dokumentasi CoreData)
    
    private var destinations: NSFetchRequest<Destination>
    
    var destinationList: [DestinationModel] {
        destinations.map { DestinationModel(
            id: $0.id!,
            name: $0.name!,
            photo: $0.photo!,
            address: $0.address!,
            latitude: $0.latitude,
            longitude: $0.longitude,
            ticketPrice: $0.ticketPrice!,
            website: $0.website,
            instagram: $0.instagram
       )}
    }
    //function for migration located here, ngebaca data dari destinationList
    
    func addDestination(name: String, photo: String?, address: String, latitude: Double, longitude: Double, ticketPrice: String?, website: String?, instagram: String?) {

            let newDestination = Destination(context: viewContext)
            newDestination.id = UUID()
            newDestination.name = name
            newDestination.photo = photo
            newDestination.address = address
            newDestination.latitude = latitude
            newDestination.longitude = longitude
            newDestination.ticketPrice = ticketPrice
            newDestination.website = website
            newDestination.instagram = instagram
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
    }
    
    func deleteDestination(destination: Destination) {
            let destinationToDelete = destinations.first { $0.id == destination.id }
            if let destinationToDelete = destinationToDelete {
                viewContext.delete(destinationToDelete)
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
    }
}
