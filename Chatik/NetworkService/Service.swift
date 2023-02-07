//
//  Service.swift
//  Chatik
//
//  Created by user on 06.02.2023.
//

import UIKit
import Firebase
import FirebaseFirestore


final class Service {
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

    func authIn(_ data: LoginField, completion: @escaping (AuthResponce) -> Void) {
        Auth.auth().signIn(withEmail: data.email, password: data.password) { result, error in
            if error != nil {
                completion(.error)

            } else {
                if let result = result {
                    if result.user.isEmailVerified {
                        completion(.success)
                    } else {
                        self.confirmEmail()
                        completion(.noVerify)
                    }

                }
            }
        }
    }

    func getUserStatus() {
        // is isset
        // auth?
    }


}
