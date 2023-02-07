//
//  AlertController.swift
//  Chatik
//
//  Created by user on 06.02.2023.
//

import UIKit

extension RegisterViewController {

    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
            self.delegate.closeVC()
        }

        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

extension AuthorizationViewController {

    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { _ in
        }

        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

