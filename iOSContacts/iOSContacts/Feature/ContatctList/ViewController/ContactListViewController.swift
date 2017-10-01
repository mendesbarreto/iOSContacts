//
//  ContactListViewController.swift
//  iOSContacts
//
//  Created by Douglas Barreto on 27/09/17.
//  Copyright © 2017 Douglas. All rights reserved.
//

import UIKit

final class ContactListViewController: UIViewController {

    private let userProvider = UserProviderFactory.create()
    private var users: [User]!

    override func viewDidLoad() {
        super.viewDidLoad()
        users = userProvider.fetchUsers()
    }
}

