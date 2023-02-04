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

    static let reusId = "SlideCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(slide: Sliders) {
        imageView.image = slide.image

    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
    }

    @IBAction func signInButtonTapped(_ sender: UIButton) {
    }

}
