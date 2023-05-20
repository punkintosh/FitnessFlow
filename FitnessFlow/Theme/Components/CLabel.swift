//
//  CLabel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit

class CLabel {
    
    
    // iOS Style guide
    public static func iOSPageTitleUnscrolled() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 34, weight: .bold)
        return label
    }
    public static func iOSPageTitleScrolledPrimaryColor() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppThemeData.colorTextPrimary
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }
    // iOS Customed
    public static func iOSSubhead() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppThemeData.colorTextLightGray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }
    
    
    
    /// -------------
    
    // Customized
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
