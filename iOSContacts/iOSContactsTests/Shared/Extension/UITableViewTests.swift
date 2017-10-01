//
// Created by Douglas Barreto on 01/10/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import UIKit
import XCTest
import CoreData

@testable import iOSContacts

final class UITableViewTests: XCTestCase {
    func testRegisterReusableCellShouldRegisterCellOnTableView() {
        //Assemble
        let tableView = UITableView(frame: CGRect(), style: .plain)
        tableView.registerReusableCell(UITableViewCell.self)

        //Action
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier)

        //Assertion
        XCTAssert(cell != nil)
    }

    func testDequeueReusableCellShouldReturnNotNullReusableCell() {
        //Assemble
        let tableView = UITableView(frame: CGRect(), style: .plain)
        tableView.registerReusableCell(UITableViewCell.self)

        //Action
        let cell: UITableViewCell? = tableView.dequeueReusableCell(indexPath: IndexPath(row: 0, section: 0))

        //Assertion
        XCTAssert(cell != nil)
    }
}
