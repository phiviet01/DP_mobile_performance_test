//
//  ViewController.swift
//  Swift-animation
//
//

import UIKit

class ViewController: UIViewController {

    let verticalStackView = UIStackView()
    let image = UIImage(named: "spiritual_animal")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.addSubview(verticalStackView)

        verticalStackView.frame = view.bounds
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually

        for _ in 0..<20 {
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            horizontalStackView.alignment = .fill
            horizontalStackView.distribution = .fillEqually
            verticalStackView.addArrangedSubview(horizontalStackView)

            for _ in 0..<10 {
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleToFill
                horizontalStackView.addArrangedSubview(imageView)

                let animation = CABasicAnimation(keyPath: "transform.rotation")
                animation.fromValue = 0
                animation.toValue =  Double.pi * 2.0
                animation.duration = 0.5
                animation.repeatCount = .infinity
                animation.isRemovedOnCompletion = false

                imageView.layer.add(animation, forKey: "spin")
            }
        }
    }
}

