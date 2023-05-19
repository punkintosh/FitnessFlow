//
//  ProfileView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    // Tab Header
    let tabHeader = CTabHeader()
    // Section 1 Header
    let section1TitleLabel = CLabel.createLabelTitle3()
    // Section 1 Body
    let nameTitleLabel = CLabel.createLabelTextButtonSize()
    let nameDataLabel = CLabel.createLabelBody()
    let emailTitleLabel = CLabel.createLabelTextButtonSize()
    let emailDataLabel = CLabel.createLabelBody()
    
    // Edit Account Details
    let editButtonAccount: CTextButton = {
        let button = CTextButton(text: "Edit", color: AppThemeData.colorTextPrimary)
        return button
    }()
    
    // Section 1 Header Layer
    let section1HeaderStackView = UIStackView()
    // Section 1 Body Layer
    let section1BodyStackView = UIStackView()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with userModel: UserModel?) {
        // Section 1
        section1TitleLabel.text = "Account Details"
        nameTitleLabel.text = "Name"
        emailTitleLabel.text = "Email"
        
        if let userModel = userModel {
            nameDataLabel.text = "\(userModel.firstName) \(userModel.lastName)"
            emailDataLabel.text = userModel.email
        } else {
            nameDataLabel.text = "Loading..."
            emailDataLabel.text = "Loading..."
        }
    }

    
    private func setupUI() {
        // Tab Header
        tabHeader.configure(title: "Profile", caption: "Manage your health data")
        addSubview(tabHeader)
        
        // Section 1 Header Layer
        section1HeaderStackView.spacing = 16
        section1HeaderStackView.addArrangedSubview(section1TitleLabel)
        section1HeaderStackView.addArrangedSubview(editButtonAccount)
        addSubview(section1HeaderStackView)
        
        // Section 1 Body Layer
        section1BodyStackView.axis = .horizontal
        section1BodyStackView.spacing = 16
        addSubview(section1BodyStackView)
        
        // Section 1 Body Layer Left
        let section1BodyTitleStackView = createStackView(axis: .vertical, spacing: 8)
        section1BodyTitleStackView.addArrangedSubview(nameTitleLabel)
        section1BodyTitleStackView.addArrangedSubview(emailTitleLabel)
        
        // Section 1 Body Layer Right
        let section1BodyDataStackView = createStackView(axis: .vertical, spacing: 8)
        section1BodyDataStackView.addArrangedSubview(nameDataLabel)
        section1BodyDataStackView.addArrangedSubview(emailDataLabel)
        
        // Section 1 Body Layer
        section1BodyStackView.addArrangedSubview(section1BodyTitleStackView)
        section1BodyStackView.addArrangedSubview(section1BodyDataStackView)
        
        createConstraints()
    }
    
    private func createStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = .leading
        return stackView
    }
    
    private func createConstraints() {
        // Tab Header
        tabHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        // Section 1 Header Layer
        section1HeaderStackView.snp.makeConstraints { make in
            make.top.equalTo(tabHeader.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Section 1 Body Layer
        section1BodyStackView.snp.makeConstraints { make in
            make.top.equalTo(section1HeaderStackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
    }
}
