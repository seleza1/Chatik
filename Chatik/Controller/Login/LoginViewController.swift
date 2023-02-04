//
//  ViewController.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit

class LoginViewController: UIViewController {

    var collectionView: UICollectionView!
    var slider: [Sliders] = []

    let Slides = SliderSlides()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        slider = Slides.getSlides()



    }

    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray

        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: SlideCollectionViewCell.reusId, bundle: nil), forCellWithReuseIdentifier: SlideCollectionViewCell.reusId)
    }


}

extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slider.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCollectionViewCell.reusId, for: indexPath) as! SlideCollectionViewCell
        let slide = slider[indexPath.row]
        cell.configure(slide: slide)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.view.frame.size
    }


}

