//
//  HomeView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
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
    
    let signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(AppThemeData.colorTextWhite, for: .normal)
        button.backgroundColor = AppThemeData.colorPrimary
        button.titleLabel?.font = AppThemeData.fontSizeButton
        button.layer.cornerRadius = AppThemeData.buttonCornerRadius
        return button
    }()
    
    init(userModel: UserModel) {
        super.init(frame: .zero)
        setupUI()
        configure(with: userModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(helloLabel)
        addSubview(sloganLabel)
        addSubview(signOutButton)
        
        helloLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        sloganLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        signOutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(sloganLabel.snp.bottom).offset(16)
            make.width.equalTo(200)
            make.height.equalTo(48)
        }
    }
    
    private func configure(with userModel: UserModel) {
        helloLabel.text = "Welcome"
        sloganLabel.text = userModel.email
    }
}


