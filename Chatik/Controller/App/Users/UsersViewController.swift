//
//  UsersViewController.swift
//  Chatik
//
//  Created by user on 07.02.2023.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: UsersTableViewCell.reuseId)
        tableView.separatorStyle = .none
        tableView.rowHeight = 100

    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.reuseId, for: indexPath) as! UsersTableViewCell
        cell.selectionStyle = .none

        return cell
    }


}
