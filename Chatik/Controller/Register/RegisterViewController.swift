//
//  RegisterViewController.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    @IBOutlet var emailView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var repeatPasswordView: UIView!
    
    var gesture: UITapGestureRecognizer? //жест
    var delegate: LoginViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        tappedUiView()

    }

    @IBAction func closeVC(_ sender: UIButton) {
        delegate.closeVC()
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
    }
}

extension RegisterViewController {

    func tappedUiView() {
        gesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(gesture!)
    }

    @objc func endEditing() {
        self.view.endEditing(true)

    }

}
