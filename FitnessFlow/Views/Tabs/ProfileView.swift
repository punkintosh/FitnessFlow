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
    // Section 1 Subhead
    let section1SubheadLabel = CLabel.createLabelSubhead()
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
    
    // Section 2 Header
    let section2TitleLabel = CLabel.createLabelTitle3()
    // Section 2 Subhead
    let section2SubheadLabel = CLabel.createLabelSubhead()
    // Section 2 Body
    let heightTitleLabel = CLabel.createLabelTextButtonSize()
    let heightDataLabel = CLabel.createLabelBody()
    let weightTitleLabel = CLabel.createLabelTextButtonSize()
    let weightDataLabel = CLabel.createLabelBody()
    let ageTitleLabel = CLabel.createLabelTextButtonSize()
    let ageDataLabel = CLabel.createLabelBody()
    let genderTitleLabel = CLabel.createLabelTextButtonSize()
    let genderDataLabel = CLabel.createLabelBody()
    let healthConditionsTitleLabel = CLabel.createLabelTextButtonSize()
    let healthConditionsDataLabel = CLabel.createLabelBody()
    
    // Edit Health Details
    let editButtonHealth: CTextButton = {
        let button = CTextButton(text: "Edit", color: AppThemeData.colorTextPrimary)
        return button
    }()
    
    // Section 2 Header Layer
    let section2HeaderStackView = UIStackView()
    // Section 2 Body Layer
    let section2BodyStackView = UIStackView()
    
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
        section1SubheadLabel.text = "We need to identify who you are"
        nameTitleLabel.text = "Name"
        emailTitleLabel.text = "Email"
        
        if let userModel = userModel {
            nameDataLabel.text = "\(userModel.firstName) \(userModel.lastName)"
            emailDataLabel.text = userModel.email
        } else {
            nameDataLabel.text = "Loading..."
            emailDataLabel.text = "Loading..."
        }
        
        // Section 2
        section2TitleLabel.text = "Health Details"
        section2SubheadLabel.text = "Enter your health data to keep track on"
        heightTitleLabel.text = "Height"
        weightTitleLabel.text = "Weight"
        ageTitleLabel.text = "Age"
        genderTitleLabel.text = "Gender"
        healthConditionsTitleLabel.text = "Health Conditions"
        
        heightDataLabel.text = "Not Set"
        weightDataLabel.text = "Not Set"
        ageDataLabel.text = "Not Set"
        genderDataLabel.text = "Not Set"
        healthConditionsDataLabel.text = "Not Set"
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
        
        // Section 1 Subhead Layer
        addSubview(section1SubheadLabel)
        
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
        
        // Section 2 Header Layer
        section2HeaderStackView.spacing = 16
        section2HeaderStackView.addArrangedSubview(section2TitleLabel)
        section2HeaderStackView.addArrangedSubview(editButtonHealth)
        addSubview(section2HeaderStackView)
        
        // Section 2 Subhead Layer
        addSubview(section2SubheadLabel)
        
        // Section 2 Body Layer
        section2BodyStackView.axis = .horizontal
        section2BodyStackView.spacing = 16
        addSubview(section2BodyStackView)
        
        // Section 2 Body Layer Left
        let section2BodyTitleStackView = createStackView(axis: .vertical, spacing: 8)
        section2BodyTitleStackView.addArrangedSubview(heightTitleLabel)
        section2BodyTitleStackView.addArrangedSubview(weightTitleLabel)
        section2BodyTitleStackView.addArrangedSubview(ageTitleLabel)
        section2BodyTitleStackView.addArrangedSubview(genderTitleLabel)
        section2BodyTitleStackView.addArrangedSubview(healthConditionsTitleLabel)
        
        // Section 2 Body Layer Right
        let section2BodyDataStackView = createStackView(axis: .vertical, spacing: 8)
        section2BodyDataStackView.addArrangedSubview(heightDataLabel)
        section2BodyDataStackView.addArrangedSubview(weightDataLabel)
        section2BodyDataStackView.addArrangedSubview(ageDataLabel)
        section2BodyDataStackView.addArrangedSubview(genderDataLabel)
        section2BodyDataStackView.addArrangedSubview(healthConditionsDataLabel)
        
        // Section 2 Body Layer
        section2BodyStackView.addArrangedSubview(section2BodyTitleStackView)
        section2BodyStackView.addArrangedSubview(section2BodyDataStackView)
        
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
        
        // Section 1 Subhead Layer
        section1SubheadLabel.snp.makeConstraints { make in
            make.top.equalTo(section1HeaderStackView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Section 1 Body Layer
        section1BodyStackView.snp.makeConstraints { make in
            make.top.equalTo(section1SubheadLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Section 2 Header Layer
        section2HeaderStackView.snp.makeConstraints { make in
            make.top.equalTo(section1BodyStackView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Section 2 Subhead Layer
        section2SubheadLabel.snp.makeConstraints { make in
            make.top.equalTo(section2HeaderStackView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Section 2 Body Layer
        section2BodyStackView.snp.makeConstraints { make in
            make.top.equalTo(section2SubheadLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
    }
}
