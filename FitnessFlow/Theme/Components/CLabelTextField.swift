//
//  CLabelTextField.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-18.
//

import UIKit

class CLabelTextField: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        configureLabel(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel(text: String) {
        self.textColor = AppThemeData.colorTextBlack
        self.font = AppThemeData.fontSizeSubhead
        self.text = text
    }
}
