//
//  UsersTableViewCell.swift
//  Chatik
//
//  Created by user on 07.02.2023.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet var bigView: UIView!
    @IBOutlet var imageUsersView: UIImageView!
    @IBOutlet var usersLabel: UILabel!

    static let reuseId = "UsersTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    func configCell(_ name: String) {
        usersLabel.text = name
    }

    private func setupCell() {
        bigView.layer.cornerRadius = 25
        imageUsersView.layer.cornerRadius = imageUsersView.frame.width / 2

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
