//
//  SlideCollectionViewCell.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var signInButton: UIButton!

    static let reuseId = "SlideCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        registerButton.isHidden = true
        signInButton.isHidden = true
    }

    func configure(slide: Sliders) {
        imageView.image = slide.image
        if slide.id == 3 {
            registerButton.isHidden = false
            signInButton.isHidden = false 
        }

    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {

    }

    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
    }

}
