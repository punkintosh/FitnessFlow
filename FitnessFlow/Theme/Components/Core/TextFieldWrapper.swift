//
//  TextFieldWrapper.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-23.
//

import UIKit

public class TextFieldWrapper {
    public static func standardTextField() -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 14)
        // Additional configuration for standard text field
        return textField
    }
    
    public static func passwordTextField() -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.isSecureTextEntry = true
        // Additional configuration for password text field
        return textField
    }
}
