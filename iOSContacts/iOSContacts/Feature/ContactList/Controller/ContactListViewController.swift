//
//  ContactListViewController.swift
//  iOSContacts
//
//  Created by Douglas Barreto on 27/09/17.
//  Copyright © 2017 Douglas. All rights reserved.
//

import UIKit

final class ContactListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let userProvider =  UserProviderFactory.create()
    private var contactsDataSource: ContactListDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupFakeData()
        setupTableView()
    }

    private func setupNavigationBar() {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addUserTapped))
        navigationItem.rightBarButtonItem = add
    }

    private func setupFakeData() {
        if userProvider.fetchUsers().count == 0 {
            try! userProvider.createUserWith(name: "Douglas", lastName: "Mendes Barreto", birthday: Date(), phone: nil, address: nil)
            try! userProvider.createUserWith(name: "Mayara Cristine", lastName: "da Veiga Mendes", birthday: Date(), phone: nil, address: nil)
            try! userProvider.createUserWith(name: "Roseli", lastName: "Moreira", birthday: Date(), phone: nil, address: nil)
        }
    }

    private func setupTableView() {
        tableView.registerReusableCell(UITableViewCell.self)
        contactsDataSource = ContactListDataSource(userProvider: userProvider) { [weak self] user in
            self?.goToContactDetails(withUser: user)
        }
        tableView.dataSource = contactsDataSource
        tableView.delegate = contactsDataSource
    }

    @objc private func addUserTapped() {
        goToContactDetails()
    }

    private func goToContactDetails(withUser: User? = nil) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: ContactDetailViewController.self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: ContactDetailViewController.self))
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
