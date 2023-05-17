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
        self.textColor = .black
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 16)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

