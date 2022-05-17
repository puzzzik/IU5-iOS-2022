//
//  CoreDataManager.swift
//  LABS
//
//  Created by Иван Тазенков on 15.04.2022.
//

import Foundation
import CoreData

// MARK: - CoreDataManagerProtocol

protocol CoreDataManagerProtocol {
    var readContext: NSManagedObjectContext { get }
    var writeContext: NSManagedObjectContext { get }
}

// MARK: - CoreDataManager

final class CoreDataManager: CoreDataManagerProtocol {
    // MARK: Internal Properties

    let persistantContainer = NSPersistentContainer(name: "Weather")

    var readContext: NSManagedObjectContext {
        persistantContainer.viewContext
    }

    var writeContext: NSManagedObjectContext {
        persistantContainer.newBackgroundContext()
    }

    // MARK: Lifecycle

    init() {
        persistantContainer.loadPersistentStores { _, error in
            if let error = error {
                assertionFailure("Unabled to load CoreDataManager: \(error)")
            }
        }
    }
}
