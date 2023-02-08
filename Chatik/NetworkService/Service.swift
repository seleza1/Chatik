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
        Auth.auth().createUser(withEmail: data.email, password: data.password) {  result, error in
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

    func getUsers(completion: @escaping ([String]) -> ()) {
        Firestore.firestore().collection("users").getDocuments { snap, error in
            if error == nil {
                var emailList = [String]()
                if let docs = snap?.documents {
                    for doc in docs {
                        let data = doc.data()
                        let email = data["email"] as! String
                        emailList.append(email)
                    }
                }
                completion(emailList)
            }
        }
    }


    func sendMessage(otherId: String, convoId: String, message: Message, text: String, completion: @escaping (Bool) -> ()) {
        if convoId == nil {
            // create new chat
        } else {
            let message: [String: Any] = [
                "date": Date(),
                "sender": message.sender.senderId,
                "text": text


            ]
            Firestore.firestore().collection("conversations").document(convoId).collection("messages").addDocument(data: message) { error in
                if error == nil {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }

    }

    func updateConvo() {

    }

    func getConfoId() {
        
    }

    func getAllMessages() {

    }

    func getOneMessage() {

    }


}
