//
//  SceneDelegate.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var userDefaults = UserDefaults.standard

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //userDefaults.set(false, forKey: "isLogin")
        let isLogin = userDefaults.object(forKey: "isLogin") as? Bool ?? false

        if isLogin {
            startApp()
        } else {
            startLogin()
        }

        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func startApp() { // когда вызовется эта ф - я произойдет следующее
        let startVC = UIStoryboard(name: "Main", bundle:  nil).instantiateViewController(withIdentifier: "TabBarViewController")
        self.window?.rootViewController = startVC
        self.window?.makeKeyAndVisible()
    }

    func startLogin() {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        self.window?.rootViewController = loginVC
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

