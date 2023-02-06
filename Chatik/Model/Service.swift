//
//  Service.swift
//  Chatik
//
//  Created by user on 06.02.2023.
//

import UIKit
import Firebase
import FirebaseFirestore

class Service {
    static let shared = Service()

    init() {}

     func createUser(_ data: LoginField, completion: @escaping (ResponceCode) -> ()) {
        Auth.auth().createUser(withEmail: data.email, password: data.password) { [weak self] result, error in
            if error == nil {
                if result != nil {
                    let userId = result?.user.uid
                    let email = data.email
                    let data: [String: Any] = ["email":email]

                    Firestore.firestore().collection("users").document(userId!).setData(data)

                    completion(ResponceCode(code: 1))
                }
            } else {
                completion(ResponceCode(code: 0))
            }
        }
    }

     func confirmEmail() {
        Auth.auth().currentUser?.sendEmailVerification()
    }
}
