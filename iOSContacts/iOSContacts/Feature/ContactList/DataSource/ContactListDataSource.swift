//
// Created by Douglas Barreto on 01/10/17.
// Copyright (c) 2017 Douglas. All rights reserved.
//

import UIKit

final class ContactListDataSource: NSObject, UITableViewDataSource {

    private let userProvider: UserProvider
    private var users: [User]
    private let didSelectContact: ((User) -> ())

    init(userProvider: UserProvider, didSelectContact: @escaping ((User) -> ())) {
        self.userProvider = userProvider
        users = userProvider.fetchUsers()
        self.didSelectContact = didSelectContact
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = "\(user.name!) \(user.lastName!)"
        return cell
    }
}

extension ContactListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectContact(users[indexPath.row])
    }
}
