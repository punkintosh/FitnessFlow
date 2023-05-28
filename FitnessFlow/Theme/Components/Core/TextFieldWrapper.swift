//
//  TextFieldWrapper.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-23.
//

import UIKit

public class TextFieldWrapper {
    public static func standardTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.placeholder = placeholder
        return textField
    }
    
    public static func passwordTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.isSecureTextEntry = true
        textField.placeholder = placeholder
        return textField
    }
}
