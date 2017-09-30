//
// Created by Douglas Barreto on 30/09/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import UIKit

final class UserProviderFactory {
    static func create() -> UserProvider {
        let appDelegate = UIApplication.shared.appDelegate
        return UserGateway(viewContext: appDelegate.persistentContainer.viewContext)
    }
}
