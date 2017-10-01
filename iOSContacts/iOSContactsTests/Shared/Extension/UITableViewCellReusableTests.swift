//
// Created by Douglas Barreto on 01/10/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import XCTest
import CoreData

@testable import iOSContacts

final class UITableViewCellReusableTests: XCTestCase {



    func testReusableIdentifierShouldReturnTableViewCellIdentifier() {
        // Assemble
        class TableViewCellTest: UITableViewCellReusable {

        }
        //Action
        let reuseIdentifier = TableViewCellTest.reuseIdentifier
        
        //Assersion
        XCTAssertEqual(reuseIdentifier, "TableViewCellTest #1")
    }
}
