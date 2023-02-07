//
//  AuthenticatorViewController.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var mainView: UIView!

    var delegate: LoginViewControllerDelegate!
    var service = Service.shared
    var checkField = CheckField.shared
    var gesture: UITapGestureRecognizer? //жест
    var userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        tappedUiView()
    }

    @IBAction func closeVC(_ sender: UIButton) {
        delegate.closeVC()
    }
    
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
    }

    @IBAction func signInTapped(_ sender: UIButton) {
        if checkField.validField(emailView, emailTextField),
           checkField.validField(passwordView, passwordTextField) {

            let authData = LoginField(email: emailTextField.text!, password: passwordTextField.text!)
            service.authIn(authData) { [weak self] responce in
                switch responce {
                case .success:
                    print("Вы авторизированы")
                    self?.userDefaults.set(true, forKey: "isLogin")
                case .noVerify:
                    self?.alert(title: "Error", message: "Вы не верифицировали свой Email. На вашу почту отправлена ссылка")
                case .error:
                    self?.alert(title: "Error", message: "Email или password не подошли")
                }
            }
        } else {
            self.alert(title: "Error", message: "Проверьте введенные данные")
            
        }

    }

    @IBAction func doNotHaveAccountTapped(_ sender: UIButton) {
        //delegate.closeVC()
        //delegate.openRegisterVC()
    }
}

extension AuthorizationViewController {

    func tappedUiView() {
        gesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        mainView.addGestureRecognizer(gesture!)
    }

    @objc func endEditing() {
        self.view.endEditing(true)

    }

}
