//
//  UsersViewController.swift
//  Chatik
//
//  Created by user on 07.02.2023.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    let service = Service.shared
    var users = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getUsers()
    }

    private func getUsers() {
        service.getUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: UsersTableViewCell.reuseId)
        tableView.separatorStyle = .none
        tableView.rowHeight = 100

    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.reuseId, for: indexPath) as! UsersTableViewCell
        cell.selectionStyle = .none
        let users = users[indexPath.row]

        cell.configCell(users)

        return cell
    }


}
