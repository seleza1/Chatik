//
//  ViewController.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit

protocol LoginViewControllerDelegate {
    func openRegisterVC()
    func openAuthorizationVC()
    func startApp()
    func closeVC()
}

final class LoginViewController: UIViewController {

    var collectionView: UICollectionView!
    var slider: [Sliders] = []
    let sliders = Sliders.getSlides()
    var authorizationVC: AuthorizationViewController!
    var registrationVC: RegisterViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        slider = sliders
    }

    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray

        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: SlideCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: SlideCollectionViewCell.reuseId)
    }


}

extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slider.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCollectionViewCell.reuseId, for: indexPath) as! SlideCollectionViewCell
        cell.delegate = self
        let slide = slider[indexPath.row]
        cell.configure(slide: slide)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.frame.size
    }
}

extension LoginViewController: LoginViewControllerDelegate {

    func openAuthorizationVC() {
        authorizationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthorizationViewController") as! AuthorizationViewController?
        self.view.insertSubview(authorizationVC.view, at: 1)
        authorizationVC.delegate = self
    }

    func openRegisterVC() {
        registrationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController?
        self.view.insertSubview(registrationVC.view, at: 1)
        registrationVC.delegate = self
    }

    func closeVC() {

        if authorizationVC != nil {
            authorizationVC.view.removeFromSuperview() // удаляем с родительского вью
            authorizationVC = nil
        }

        if registrationVC != nil {
            registrationVC.view.removeFromSuperview()
            registrationVC = nil

        }

    }

    func startApp() {
        let startVC = UIStoryboard(name: "Main", bundle:  nil).instantiateViewController(withIdentifier: "TabBarViewController")
        self.view.insertSubview(startVC.view, at: 2)
    }
}

