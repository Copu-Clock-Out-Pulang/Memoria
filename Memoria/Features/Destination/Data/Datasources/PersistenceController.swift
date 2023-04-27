//
//  PersistenceController.swift
//  Memoria
//
//  Created by Winxen Ryandiharvin on 24/04/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    var persistentStoreCoordinator: NSPersistentStoreCoordinator {
        return container.persistentStoreCoordinator
    }
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MemoriaCoreData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    )}
}
