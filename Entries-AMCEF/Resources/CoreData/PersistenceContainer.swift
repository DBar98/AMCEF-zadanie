//
//  DatabaseContainer.swift
//  Entries-AMCEF
//
//  Created by Dávid Baľak on 18/02/2023.
//

import CoreData

class PersistenceController: ObservableObject {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "EntriesData")

        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                NSLog("Unable to load container, with error: \(error.localizedDescription)")
            }
        }
    }
}
