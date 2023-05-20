//
//  CLabel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit

class CLabel {
    
    public static func createLabelTitle3() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = AppThemeData.fontSizeTitle3
        return label
    }
    
    public static func createLabelBody() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = AppThemeData.fontSizeBody
        return label
    }
    
    public static func createLabelTextButtonSize() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = AppThemeData.fontSizeTextButton
        return label
    }
    
    public static func createLabelSubhead() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextDarkGray
        label.font = AppThemeData.fontSizeSubhead
        return label
    }
    
}
