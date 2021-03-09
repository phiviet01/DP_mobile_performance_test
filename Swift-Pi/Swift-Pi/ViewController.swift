//
//  ViewController.swift
//  Swift-Pi
//
//

import UIKit

class ViewController: UIViewController {

    lazy var stackview = UIStackView()
    lazy var label = UILabel()
    lazy var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.addSubview(stackview)

        view.translatesAutoresizingMaskIntoConstraints = false

        stackview.frame = view.bounds
        stackview.spacing = 20
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillEqually

        stackview.addArrangedSubview(button)
        stackview.addArrangedSubview(label)

        label.text = "0 ms"
        button.setTitle("Calculate pi", for: .normal)
        button.backgroundColor = .systemBlue

        button.addAction(
            UIAction(handler: { [weak self] _ -> Void in self?.measure() }),
            for: .touchUpInside
        )
    }

    func measure() {
        let start = Time.millisecondsNow()

        _ = Pi.getPIByGaussLegendre(iterations: 10_000_000)

        let end = Time.millisecondsNow()

        label.text = "\(end - start) ms"
    }
}

struct Time {
    static func millisecondsNow() -> TimeInterval {
        return Date().timeIntervalSince1970 * 1000
    }
}

struct Pi {
    static func getPIByGaussLegendre(iterations: Int) -> Double  {
        var a0: Double = 1.0
        var b0: Double = 1.0 / sqrt(2.0)
        var t0: Double = 1.0 / 4.0
        var p0: Double = 1.0

        var i = 0
        while (i < iterations) {
          i = i + 1
          let an: Double = (a0 + b0) / 2
          let bn: Double = sqrt(a0 * b0)
          let tn: Double = t0 - p0 * pow(a0 - an, 2.0)
          let pn: Double = 2 * p0
          a0 = an
          b0 = bn
          t0 = tn
          p0 = pn
        }

        return pow(a0 + b0, 2.0) / (4 * t0)
    }
}
