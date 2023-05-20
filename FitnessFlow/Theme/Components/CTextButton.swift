//
//  CTextButton.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit

class CTextButton: UILabel {
    init(text: String, color: UIColor) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = color
        self.textAlignment = .center
        self.font = .systemFont(ofSize: 16, weight: .semibold)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

