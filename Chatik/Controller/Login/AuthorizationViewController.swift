//
//  AuthenticatorViewController.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit

class AuthorizationViewController: UIViewController {

    var delegate: LoginViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeVC(_ sender: UIButton) {
        delegate.closeVC()
    }
    
}
