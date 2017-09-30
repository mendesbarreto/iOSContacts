//
// Created by Douglas Barreto on 30/09/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import UIKit
import CoreData

final class UserFactory {
    static func createUser() throws -> User {
        let appDelegate = UIApplication.shared.appDelegate
        return User(context: appDelegate.persistentContainer.viewContext)
    }
}
