//
//  NSManagedObjectTests.swift
//  iOSContactsTests
//
//  Created by Douglas Barreto on 30/09/17.
//  Copyright © 2017 Douglas. All rights reserved.
//

import XCTest
import CoreData

@testable import iOSContacts

final class NSManagedObjectTests: XCTestCase {

    func testUserEntityNameReturnNameOfCoreDataEntity() {
        let entityName = User.entityName
        XCTAssertEqual(entityName, String(describing: User.self))
    }
    
    func testPhoneEntityNameReturnNameOfCoreDataEntity() {
        let entityName = Phone.entityName
        XCTAssertEqual(entityName, String(describing: Phone.self))
    }
    
}
