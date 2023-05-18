//
//  HomeView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    //    let authHeader = CAuthHeader()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = AppThemeData.fontSizeTitle1
        return label
    }()
    
    let sloganLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextLightGray
        label.font = AppThemeData.fontSizeTitle2
        label.numberOfLines = 0
        return label
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(AppThemeData.colorTextWhite, for: .normal)
        button.backgroundColor = AppThemeData.colorPrimary
        button.titleLabel?.font = AppThemeData.fontSizeButton
        button.layer.cornerRadius = AppThemeData.buttonCornerRadius
        return button
    }()
    
    init(homeModel: HomeModel) {
        super.init(frame: .zero)
        setupUI()
        configure(with: homeModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        //        addSubview(authHeader)
        addSubview(helloLabel)
        addSubview(sloganLabel)
        addSubview(continueButton)
        
        //        authHeader.configure(title: "Sign Up", caption: "Create your account", imageName: "logo_l.png")
        //
        //        authHeader.snp.makeConstraints { make in
        //            make.top.leading.trailing.equalToSuperview()
        //            make.height.equalTo(88)
        //        }
        
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
            make.height.equalTo(48)
        }
    }
    
    private func configure(with homeModel: HomeModel) {
        helloLabel.text = homeModel.appName
        sloganLabel.text = homeModel.appDescription
    }
}


