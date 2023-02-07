//
//  Model.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit


enum AuthResponce {
    case success, error, noVerify
}
struct Sliders {
    var id: Int
    var image: UIImage

    static func getSlides() -> [Sliders] {
        var slider: [Sliders] = []

        let sliderOne = Sliders(id: 1, image: UIImage(named: "Flower")!)
        let sliderSecond = Sliders(id: 2, image: UIImage(named: "More")!)
        let sliderTwo = Sliders(id: 3, image: UIImage(named: "Brain")!)

        slider.append(sliderOne)
        slider.append(sliderSecond)
        slider.append(sliderTwo)

        return slider
    }
}

struct LoginField {
    var email: String
    var password: String

}

struct ResponceCode {
    var code: Int
}
