//
//  ViewController.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit

class LoginViewController: UIViewController {

    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()

    }

    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray

        self.view.addSubview(collectionView)
    }


}

