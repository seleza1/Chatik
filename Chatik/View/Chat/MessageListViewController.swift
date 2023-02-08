//
//  MessageListViewController.swift
//  Chatik
//
//  Created by user on 08.02.2023.
//

import UIKit

class MessageListViewController: UIViewController {

    let reuseMessage = "cell"

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseMessage)
    }
}

extension MessageListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseMessage, for: indexPath)
        cell.textLabel?.text = "fe"

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatVC = ChatViewController()
        navigationController?.pushViewController(chatVC, animated: true)
    }


}
