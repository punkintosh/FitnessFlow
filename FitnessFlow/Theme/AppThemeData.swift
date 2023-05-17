//
//  AppThemeData.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit

// Convert RGB into hex
extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    var hexString: String {
        guard let components = cgColor.components, components.count >= 3 else {
            return ""
        }

        let red = UInt(components[0] * 255.0)
        let green = UInt(components[1] * 255.0)
        let blue = UInt(components[2] * 255.0)

        return String(format: "#%02lX%02lX%02lX", red, green, blue)
    }
}

class AppThemeData {
    // Strings
    static let appName = "FitnessFlow"
    static let appDescription = "Go with the flow and build your fitness."
    // Colors
    static let colorPrimary = UIColor(hex: 0xFF5722)
    static let colorSecondaryBlack = UIColor(hex: 0x101010)
    static let colorSecondaryGray = UIColor(hex: 0x757575)
    static let colorSecondaryWhite = UIColor(hex: 0xFFFFFF)
    static let colorTertiaryBlack = UIColor(hex: 0x000000)
    static let colorTertiaryLightGray = UIColor(hex: 0x979797)
    static let colorTertiaryWhite = UIColor(hex: 0xFAFAFA)
    static let colorFontWhite = UIColor(hex: 0xFFFFFF)
    static let colorFontBlack = UIColor(hex: 0x101010)
    static let colorFontLightGray = UIColor(hex: 0x757575)
    static let colorFontDarkGray = UIColor(hex: 0x333333)
    static let colorFontOrange = UIColor(hex: 0xFF5722)
    // Fonts
    static let fontSizeHeader: UIFont = .boldSystemFont(ofSize: 24)
    static let fontSizeSubHeader: UIFont = .systemFont(ofSize: 16)
    // Buttons
    static let buttonFontSize: UIFont = .boldSystemFont(ofSize: 16)
    static let buttonCornerRadius: CGFloat = 8
}
