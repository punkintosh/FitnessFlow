//
//  HomeScreen.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit

class HomeScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppInfo.colorSecondary_White

        
        let helloLabel = UILabel()
        helloLabel.text = AppInfo.appName
        helloLabel.textAlignment = .center
        helloLabel.textColor = AppInfo.colorFont_Black
        helloLabel.font = AppInfo.fontSizeHeader
        helloLabel.translatesAutoresizingMaskIntoConstraints = false

        let sloganLabel = UILabel()
        sloganLabel.text = AppInfo.appDescription
        sloganLabel.textAlignment = .center
        sloganLabel.textColor = AppInfo.colorFont_LightGray
        sloganLabel.font = AppInfo.fontSizeSubHeader
        sloganLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let continueButton = UIButton()
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.backgroundColor = AppInfo.colorPrimary
        continueButton.titleLabel?.font = AppInfo.buttonFontSize
        continueButton.layer.cornerRadius = AppInfo.buttonCornerRadius
        continueButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(continueButton)
        view.addSubview(helloLabel)
        view.addSubview(sloganLabel)

        helloLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        sloganLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        continueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(sloganLabel.snp.bottom).offset(16)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
}


