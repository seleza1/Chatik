//
//  RegisterViewController.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit

final class RegisterViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repeatPasswordTextField: UITextField!
    @IBOutlet var emailView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var repeatPasswordView: UIView!

    var gesture: UITapGestureRecognizer? //жест
    var delegate: LoginViewControllerDelegate!
    var checkField = CheckField.shared
    var service = Service.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        tappedUiView()

    }

    @IBAction func closeVC(_ sender: UIButton) {
        delegate.closeVC()
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        if checkField.validField(emailView, emailTextField),
           checkField.validField(passwordView, passwordTextField)
        {
            if passwordTextField.text == repeatPasswordTextField.text {
                service.createUser(LoginField(email: emailTextField.text!, password: passwordTextField.text!)) {[weak self] code in
                    switch code.code {
                    case 0:
                        print("Произошла ошибка")
                    case 1:
                        print("Успешно зарегистрировались")
                        self?.service.confirmEmail()

                        self?.alert(title: "Success!", message: "На вашу почту пришло сообщение для подтверждения вашего email")

                    default:
                        print("Неизвестная ошибка")
                    }
                }
            } else {
                print("поля не совпадают")
            }

        }
        
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
