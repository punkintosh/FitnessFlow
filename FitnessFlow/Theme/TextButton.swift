//
//  TextButton.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit

class TextButton: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = AppThemeData.colorTextDarkGray
        self.textAlignment = .center
        self.font = AppThemeData.fontSizeTextButton
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

