//
//  ButtonWrapper.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-23.
//

import UIKit

public class ButtonWrapper {
    public static func primaryButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(AppThemeData.colorTextWhite, for: .normal)
        button.backgroundColor = AppThemeData.colorPrimary
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = AppThemeData.cornerRadiusButton
        return button
    }
    
    public static func secondaryButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(AppThemeData.colorTextWhite, for: .normal)
        button.backgroundColor = AppThemeData.colorSecondaryBlack
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = AppThemeData.cornerRadiusButton
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
