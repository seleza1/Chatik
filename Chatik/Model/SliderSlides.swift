//
//  SliderSlides.swift
//  Chatik
//
//  Created by user on 04.02.2023.
//

import UIKit

class SliderSlides {

    func getSlides() -> [Sliders] {
        var slider: [Sliders] = []

        let sliderOne = Sliders(id: 1, image: UIImage(named: "Divan")!)
        let sliderSecond = Sliders(id: 2, image: UIImage(named: "Divan")!)
        let sliderTwo = Sliders(id: 3, image: UIImage(named: "Divan")!)

        slider.append(sliderOne)
        slider.append(sliderSecond)
        slider.append(sliderTwo)

        return slider
    }
}
