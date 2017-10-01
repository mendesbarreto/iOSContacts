//
// Created by Douglas Barreto on 01/10/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import UIKit

extension UITableView {
    func insertSingleRow(at row: Int, inSections session: Int = 0, withAnimation animation: UITableViewRowAnimation) {
        beginUpdates()
        insertRows(at: [IndexPath(row: row, section: session)], with: animation)
        endUpdates()
    }

    func deleteSingleRow(at row: Int, inSections session: Int = 0, withAnimation animation: UITableViewRowAnimation) {
        beginUpdates()
        deleteRows(at:  [IndexPath(row: row, section: session)], with: animation)
        endUpdates()
    }
}

extension UITableView {

    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: UITableViewCellReusable {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: UITableViewCellReusable {
        // swiftlint:disable:next force_cast
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
