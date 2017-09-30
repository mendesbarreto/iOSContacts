//
// Created by Douglas Barreto on 30/09/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import CoreData

protocol UserProvider {
    func fetchUsers() -> [User]
    func create(user: User)
    func update(user: User)
    func delete(user: User)
    func save()
}

final class UserGateway: UserProvider {
    private let viewContext: NSManagedObjectContext

    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
    }

    func create(user: User) {
        fatalError("create() has not been implemented")
    }

    func update(user: User) {
        fatalError("update() has not been implemented")
    }

    func delete(user: User) {
        fatalError("delete() has not been implemented")
    }

    func fetchUsers() -> [User] {
        fatalError("fetchUsers() has not been implemented")
    }

    func save() {
        fatalError("save() has not been implemented")
    }
}
