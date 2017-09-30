//
// Created by Douglas Barreto on 30/09/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import CoreData

protocol UserProvider {
    func save() throws
    func fetchUsers() -> [User]
    func delete(user: User) throws
    func createUserWith(name: String,
                        lastName: String,
                        birthday: Date,
                        phone: Phone?,
                        address: Address?) throws -> User
}

final class UserGateway: UserProvider {
    private let viewContext: NSManagedObjectContext

    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
    }

    func createUserWith(name: String,
                        lastName: String,
                        birthday: Date,
                        phone: Phone? = nil,
                        address: Address? = nil) throws -> User {

        let user = UserFactory.createUser()
        user.name = name
        user.lastName = lastName
        user.phone = phone
        user.address = address

        try save()

        return user
    }

    func delete(user: User) throws {
        let deleteRequest = NSBatchDeleteRequest(objectIDs: [user.objectID])
        do {
            try viewContext.execute(deleteRequest)
        } catch {
            throw UserError.problemToDeleteUser
        }
    }

    func fetchUsers() -> [User] {
        do {
            let request = NSFetchRequest<User>(entityName: User.entityName)
            return try viewContext.fetch(request)
        } catch let error {
            print("Problem to search users in coredata because: \(error.localizedDescription)")
            return [User]()
        }
    }

    func save() throws {
        do {
            try viewContext.save()
        } catch {
            print("Problem to save user in coredata")
            throw UserError.problemToSaveUser
        }
    }
}
