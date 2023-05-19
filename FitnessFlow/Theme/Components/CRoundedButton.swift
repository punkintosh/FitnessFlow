//
//  CRoundedButton.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit

class CRoundedButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(AppThemeData.colorTextWhite, for: .normal)
        self.backgroundColor = AppThemeData.colorPrimary
        self.titleLabel?.font = AppThemeData.fontSizeButton
        self.layer.cornerRadius = AppThemeData.cornerRadiusButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
