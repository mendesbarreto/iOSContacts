//
// Created by Douglas Barreto on 01/10/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import UIKit

protocol UITableViewCellReusable: class {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
}

extension UITableViewCellReusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
