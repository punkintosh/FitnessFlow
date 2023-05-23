//
//  ButtonWrapper.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-23.
//

import UIKit

public class ButtonWrapper {
    public static func primaryButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        // Additional configuration for primary button
        return button
    }
    
    public static func secondaryButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        // Additional configuration for secondary button
        return button
    }
    
    public static func textButton() -> UILabel {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 14)
        label.isUserInteractionEnabled = true
        // Additional configuration for text button
        return label
    }
}


//import UIKit
//
//class ViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let textButton = ButtonWrapper.textButton()
//        textButton.text = "Press Me"
//        textButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(textButtonTapped)))
//        view.addSubview(textButton)
//
//        // Position the textButton using Auto Layout constraints
//        textButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            textButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            textButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
//    }
//
//    @objc func textButtonTapped() {
//        print("Text button tapped!")
//    }
//}
