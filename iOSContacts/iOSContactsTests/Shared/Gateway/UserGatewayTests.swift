//
//  UserGatewayTests.swift
//  iOSContactsTests
//
//  Created by Douglas Barreto on 30/09/17.
//  Copyright © 2017 Douglas. All rights reserved.
//

import XCTest
import CoreData

@testable import iOSContacts

final class UserGatewayTests: XCTestCase {

    private var viewContext: NSManagedObjectContext!
    private var userProvider: UserProvider!

    override func setUp() {
        super.setUp()
        viewContext = UIApplication.shared.appDelegate.persistentContainer.viewContext
        NSManagedObjectContext.clear(viewContext: viewContext)
        userProvider = UserGateway(viewContext: viewContext)
    }
    
    override func tearDown() {
        super.tearDown()
        NSManagedObjectContext.clear(viewContext: viewContext)
    }
    
    func testCreateUserReturnUserCreatedOnCoreData() {
        //Assemble
        let user = createUser()
        let request = NSFetchRequest<User>(entityName: User.entityName)
        
        //Action
        let savedUser = try! viewContext.fetch(request).first!

        XCTAssertEqual(user.objectID, savedUser.objectID)
        XCTAssertEqual(user.name, savedUser.name)
        XCTAssertEqual(user.lastName, savedUser.lastName)
    }
    
    func testUpdateUserShouldPersistPropertyChangeOnCoreData() {
        //Assemble
        let newName = "New Name"
        let newLastName = "New Last Name"
        let user = createUser()
        let request = NSFetchRequest<User>(entityName: User.entityName)

        //Action
        user.name = newName
        user.lastName = newLastName
        try! userProvider.save()
        let savedUser = try! viewContext.fetch(request).first!

        //Assertion
        XCTAssertEqual(savedUser.name, newName)
        XCTAssertEqual(savedUser.lastName, newLastName)
    }

    func testFetchTwoUsersFromCoreData() {
        //Assemble
        _ = createUser()
        _ = createUser()
    
        //Action
        let users = userProvider.fetchUsers()

        //Assert
        XCTAssertEqual(users.count, 2)
    }

    func testFetchOneUserFromCoreData() {
        //Assemble
        _ = createUser()
        
        //Action
        let users = userProvider.fetchUsers()

        //Assert
        XCTAssertEqual(users.count, 1)
    }

    func testDeleteUserFromCoreData() {
        //Assemble
        let user = createUser()
        
        //Action
        try! userProvider.delete(user: user)
        let users = userProvider.fetchUsers()

        //Assert
        XCTAssertEqual(users.count, 0)
    }

    func testDeleteTheSameUserTwiceFromCoreDataShouldNotGetError() {
        //Assemble
        let user = createUser()

        //Action
        try! userProvider.delete(user: user)
        try! userProvider.delete(user: user)
        let users = userProvider.fetchUsers()

        //Assert
        XCTAssertEqual(users.count, 0)
    }


    private func createUser() -> User {
        return try! userProvider.createUserWith(name: "Douglas", lastName: "Mendes", birthday: Date(), phone: nil, address: nil)
    }
}
