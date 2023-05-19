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
    // Section Header
    let userLabel = CLabel.createLabelTitle3()
    // Section Body
    let nameTitleLabel = CLabel.createLabelTextButtonSize()
    let nameDataLabel = CLabel.createLabelBody()
    let emailTitleLabel = CLabel.createLabelTextButtonSize()
    let emailDataLabel = CLabel.createLabelBody()
    
    // Edit Account Details
    let editButtonAccount: CTextButton = {
        let button = CTextButton(text: "Edit", color: AppThemeData.colorTextPrimary)
        return button
    }()
    
    // Section Header Layer
    let headerStackView = UIStackView()
    // Section Body Layer
    let contentStackView = UIStackView()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with userModel: UserModel?) {
        guard let userModel = userModel else {
            // Handle the case when userModel is nil or not available
            return
        }
        userLabel.text = "Account Details"
        nameTitleLabel.text = "Name"
        nameDataLabel.text = "\(userModel.firstName) \(userModel.lastName)"
        emailTitleLabel.text = "Email"
        emailDataLabel.text = userModel.email
    }
    
    private func setupUI() {
        // Tab Header
        tabHeader.configure(title: "Profile", caption: "Manage your health data")
        addSubview(tabHeader)
        
        // Section Header Layer
        headerStackView.spacing = 16
        headerStackView.addArrangedSubview(userLabel)
        headerStackView.addArrangedSubview(editButtonAccount)
        addSubview(headerStackView)
        
        // Section Body Layer
        contentStackView.axis = .horizontal
        contentStackView.spacing = 16
        addSubview(contentStackView)
        
        // Section Body Layer Left
        let titleStackView = createStackView(axis: .vertical, spacing: 8)
        titleStackView.addArrangedSubview(nameTitleLabel)
        titleStackView.addArrangedSubview(emailTitleLabel)
        
        // Section Body Layer Right
        let dataStackView = createStackView(axis: .vertical, spacing: 8)
        dataStackView.addArrangedSubview(nameDataLabel)
        dataStackView.addArrangedSubview(emailDataLabel)
        
        contentStackView.addArrangedSubview(titleStackView)
        contentStackView.addArrangedSubview(dataStackView)
        
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
        
        // Section Header Layer
        headerStackView.snp.makeConstraints { make in
            make.top.equalTo(tabHeader.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Section Body Layer
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
    }
}
