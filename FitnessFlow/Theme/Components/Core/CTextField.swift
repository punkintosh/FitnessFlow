//
//  CustomTextField.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-18.
//

import UIKit

class CTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        configureTextField(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField(placeholder: String) {
        self.placeholder = placeholder
        self.font = .systemFont(ofSize: 17, weight: .regular)
        self.borderStyle = .roundedRect
    }
}
