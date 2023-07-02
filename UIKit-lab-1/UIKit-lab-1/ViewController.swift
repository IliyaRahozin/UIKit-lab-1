//
//  ViewController.swift
//  UIKit-lab-1
//
//  Created by Iliya Rahozin on 02.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var customView: RoundedGradientView = {
        let view = RoundedGradientView(colors: [UIColor(red: 0.4, green: 0.6, blue: 0.76, alpha: 1.00).cgColor,
                                                UIColor(red: 0.91, green: 0.3, blue: 0.23, alpha: 1.00).cgColor
                                               ])
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.addSubview(customView)
        
        NSLayoutConstraint.activate([
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            customView.widthAnchor.constraint(equalToConstant: 150),
            customView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }


}



final class RoundedGradientView: UIView {
    private var gradColors: [CGColor]
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    init(frame: CGRect = .zero, colors: [CGColor] = [UIColor.blue.cgColor, UIColor.red.cgColor]) {
        self.gradColors = colors
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.gradColors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        if let gradientLayer = self.layer as? CAGradientLayer {
            gradientLayer.colors = gradColors
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }
        
        // Add a shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 5, height: 15)
        layer.shadowRadius = 4
        
        // Set corner radius
        layer.cornerRadius = 20
    }
}
