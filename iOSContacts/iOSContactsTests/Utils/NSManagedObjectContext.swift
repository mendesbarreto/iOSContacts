//
// Created by Douglas Barreto on 30/09/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import CoreData

@testable import iOSContacts

extension NSManagedObjectContext {
    static func inMemory() -> NSManagedObjectContext {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)

        // swiftlint:disable:next force_try
        try! persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil,
                                                           options: nil)

        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        return managedObjectContext
    }

    static func clear(viewContext: NSManagedObjectContext) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: User.entityName)
        let deleteBatch = NSBatchDeleteRequest(fetchRequest: request)
        try! viewContext.execute(deleteBatch)
    }
}
