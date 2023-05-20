//
//  LogInView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-18.
//

import UIKit
import SnapKit

class LogInView: UIView {
    
    let authHeader = CAuthHeader()
    
    let emailLabel = CLabel.iOSSubhead()
    let passwordLabel = CLabel.iOSSubhead()
    
    let emailTextField = CTextField(placeholder: "Email")
    let passwordTextField = CTextField(placeholder: "Password")
    
    let logInButton: CRoundedButton = {
        let button = CRoundedButton(title: "Log In")
        return button
    }()
    
    let switchLoginButton: CTextButton = {
        let button = CTextButton(text: "New User? Sign Up", color: AppThemeData.colorTextDarkGray)
        return button
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupUI()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        emailLabel.text = "Email"
        passwordLabel.text = "Password"
    }
    
    private func setupUI() {
        addSubview(authHeader)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(logInButton)
        addSubview(switchLoginButton)
        
        authHeader.configure(title: "Log In", caption: "Manage your activities", imageName: "logo_l.png")
        
        authHeader.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(authHeader.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
        switchLoginButton.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
    }
}

