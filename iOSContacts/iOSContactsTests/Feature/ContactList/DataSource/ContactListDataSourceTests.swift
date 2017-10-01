//
//  ContactListDataSourceTests.swift
//  iOSContactsTests
//
//  Created by Douglas Barreto on 01/10/17.
//  Copyright © 2017 Douglas. All rights reserved.
//

import CoreData
import UIKit
import XCTest

@testable import iOSContacts

class ContactListDataSourceTests: XCTestCase {
    
    var contactListProvider: ContactListDataSource!
    var viewContext: NSManagedObjectContext!
    var userProvider: UserProvider!
    var tableView: UITableView!

    override func setUp() {
        super.setUp()
        userProvider = UserProviderFactory.create()
        viewContext = UIApplication.shared.appDelegate.persistentContainer.viewContext
        tableView = UITableView(frame: CGRect(), style: .plain)
        tableView.registerReusableCell(UITableViewCell.self)
        NSManagedObjectContext.clear(viewContext: viewContext)
    }
    
    override func tearDown() {
        NSManagedObjectContext.clear(viewContext: viewContext)
        super.tearDown()
    }
    
    func testDidSelectUser() {
        //Assemble
        let userFirst = createUser()
        _ = createUser()
        var tappedUser: User? = nil

        contactListProvider = ContactListDataSource(userProvider: userProvider) { user in
            tappedUser = user
        }

        tableView.dataSource = contactListProvider
        tableView.delegate = contactListProvider

        //Action
        contactListProvider.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

        //Assertion
        XCTAssert(tappedUser != nil)
        XCTAssertEqual(tappedUser, userFirst)
    }
    
    func testCellForRowAtIndexReturnsCellWithTextLabelWithUserName() {
        //Assemble
        let user = createUser()
        let userFullName =  "\(user.name!) \(user.lastName!)"

        contactListProvider = ContactListDataSource(userProvider: userProvider) { _ in }
        tableView.dataSource = contactListProvider

        //Action
        let cell = contactListProvider.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))

        //Assertion
        XCTAssert(cell.textLabel!.text! == userFullName)
    }
    
    private func createUser() -> User {
        return try! userProvider.createUserWith(name: "Douglas", lastName: "Mendes", birthday: Date(), phone: nil, address: nil)
    }
}
