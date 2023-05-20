//
//  CreateAccountView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import UIKit
import SnapKit

class CreateAccountView: UIView {
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let helloLabel = CLabel.iOSPageTitleUnscrolled()
    let sloganLabel = CLabel.iOSPageTitleScrolledPrimaryColor()
    
    let signUpButton: CRoundedButton = {
        let button = CRoundedButton(title: "Create My Account")
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(helloLabel)
        addSubview(sloganLabel)
        addSubview(signUpButton)
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.width.equalTo(250)
            make.height.equalTo(250)
        }
        
        helloLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        sloganLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(32)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
    
    func configure(userModel: UserModel) {
        imageView.image = UIImage(named: "logo_l")
        helloLabel.text = "Welcome"
        sloganLabel.text = userModel.firstName + " " + userModel.lastName
    }

}

