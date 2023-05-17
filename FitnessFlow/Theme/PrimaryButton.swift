//
//  PrimaryButton.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit

class PrimaryButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(AppThemeData.colorFontWhite, for: .normal)
        self.backgroundColor = AppThemeData.colorPrimary
        self.titleLabel?.font = AppThemeData.buttonFontSize
        self.layer.cornerRadius = AppThemeData.buttonCornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
