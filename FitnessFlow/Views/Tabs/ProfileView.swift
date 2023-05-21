//
//  ProfileView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    let tabHeaderTitle = CLabel.iOSPageTitleUnscrolled()
    let tabHeaderCaption = CLabel.iOSSubhead()
    
    // Account Header
    let accountTitleLabel = CLabel.createLabelTitle3()
    // Account Subhead
    let accountSubheadLabel = CLabel.createLabelSubhead()
    // Account Body
    let nameTitleLabel = CLabel.createLabelTextButtonSize()
    let nameDataLabel = CLabel.createLabelBody()
    let emailTitleLabel = CLabel.createLabelTextButtonSize()
    let emailDataLabel = CLabel.createLabelBody()
    
    // Edit Account Details
    let editButtonAccount: CTextButton = {
        let button = CTextButton(text: "Edit", color: AppThemeData.colorTextPrimary)
        return button
    }()
    
    // Account Header Layer
    let accountHeaderStackView = UIStackView()
    // Account Body Layer
    let accountBodyStackView = UIStackView()
    
    // Health Header
    let healthTitleLabel = CLabel.createLabelTitle3()
    // Health Subhead
    let healthSubheadLabel = CLabel.createLabelSubhead()
    // Health Body
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
    
    // Health Header Layer
    let healthHeaderStackView = UIStackView()
    // Health Body Layer
    let healthBodyStackView = UIStackView()
    
    // Fitness Header
    let fitnessTitleLabel = CLabel.createLabelTitle3()
    // Fitness Subhead
    let fitnessSubheadLabel = CLabel.createLabelSubhead()
    // Fitness Body
    let fitnessGoalTitleLabel = CLabel.createLabelTextButtonSize()
    let fitnessGoalDataLabel = CLabel.createLabelBody()
    let fitnessLevelTitleLabel = CLabel.createLabelTextButtonSize()
    let fitnessLevelDataLabel = CLabel.createLabelBody()
    
    // Edit Fitness Details
    let editButtonFitness: CTextButton = {
        let button = CTextButton(text: "Edit", color: AppThemeData.colorTextPrimary)
        return button
    }()
    
    // Fitness Header Layer
    let fitnessHeaderStackView = UIStackView()
    // Fitness Body Layer
    let fitnessBodyStackView = UIStackView()
    
    let signOutButton: CRoundedButton = {
        let button = CRoundedButton(title: "Sign Out")
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        tabHeaderTitle.text = "Profile"
        tabHeaderCaption.text = "Manage your health data"
        // Account
        accountTitleLabel.text = "Account Details"
        accountSubheadLabel.text = "We need to identify who you are"
        nameTitleLabel.text = "Name"
        emailTitleLabel.text = "Email"
        
        nameDataLabel.text = "Dileepa Bandara"
        emailDataLabel.text = "contact@dileepabandara.dev"
        
        // Health
        healthTitleLabel.text = "Health Details"
        healthSubheadLabel.text = "Enter your health data to keep track on"
        heightTitleLabel.text = "Height"
        weightTitleLabel.text = "Weight"
        ageTitleLabel.text = "Age"
        genderTitleLabel.text = "Gender"
        healthConditionsTitleLabel.text = "Health Conditions"
        
        heightDataLabel.text = "178"
        weightDataLabel.text = "78"
        ageDataLabel.text = "24"
        genderDataLabel.text = "Male"
        healthConditionsDataLabel.text = "Not Set"
        
        // Fitness
        fitnessTitleLabel.text = "Fitness Details"
        fitnessSubheadLabel.text = "Optimize your fitness model"
        fitnessGoalTitleLabel.text = "Fitness Goal"
        fitnessLevelTitleLabel.text = "Fitness Level"
        
        fitnessGoalDataLabel.text = "Keep Fit"
        fitnessLevelDataLabel.text = "Beginner"
    }
    
    
    private func setupUI() {
        
        addSubview(tabHeaderTitle)
        addSubview(tabHeaderCaption)
        
        setupAccountLayerUI()
        setupHealthLayerUI()
        setupFitnessLayerUI()
        
        createConstraintsAccountLayer()
        createConstraintsHealthLayer()
        createConstraintsFitnessLayer()
        
        addSubview(signOutButton)
        signOutButton.snp.makeConstraints { make in
            make.top.equalTo(fitnessBodyStackView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
    
    private func setupAccountLayerUI(){
        
        // Account Header Layer
        accountHeaderStackView.spacing = 16
        accountHeaderStackView.addArrangedSubview(accountTitleLabel)
        accountHeaderStackView.addArrangedSubview(editButtonAccount)
        addSubview(accountHeaderStackView)
        
        // Account Subhead Layer
        addSubview(accountSubheadLabel)
        
        // Account Body Layer
        accountBodyStackView.axis = .horizontal
        accountBodyStackView.spacing = 16
        addSubview(accountBodyStackView)
        
        // Account Body Layer Left
        let accountBodyTitleStackView = createStackView(axis: .vertical, spacing: 8)
        accountBodyTitleStackView.addArrangedSubview(nameTitleLabel)
        accountBodyTitleStackView.addArrangedSubview(emailTitleLabel)
        
        // Account Body Layer Right
        let accountBodyDataStackView = createStackView(axis: .vertical, spacing: 8)
        accountBodyDataStackView.addArrangedSubview(nameDataLabel)
        accountBodyDataStackView.addArrangedSubview(emailDataLabel)
        
        // Account Body Layer
        accountBodyStackView.addArrangedSubview(accountBodyTitleStackView)
        accountBodyStackView.addArrangedSubview(accountBodyDataStackView)
    }
    
    private func setupHealthLayerUI(){
        
        // Health Header Layer
        healthHeaderStackView.spacing = 16
        healthHeaderStackView.addArrangedSubview(healthTitleLabel)
        healthHeaderStackView.addArrangedSubview(editButtonHealth)
        addSubview(healthHeaderStackView)
        
        // Health Subhead Layer
        addSubview(healthSubheadLabel)
        
        // Health Body Layer
        healthBodyStackView.axis = .horizontal
        healthBodyStackView.spacing = 16
        addSubview(healthBodyStackView)
        
        // Health Body Layer Left
        let healthBodyTitleStackView = createStackView(axis: .vertical, spacing: 8)
        healthBodyTitleStackView.addArrangedSubview(heightTitleLabel)
        healthBodyTitleStackView.addArrangedSubview(weightTitleLabel)
        healthBodyTitleStackView.addArrangedSubview(ageTitleLabel)
        healthBodyTitleStackView.addArrangedSubview(genderTitleLabel)
        healthBodyTitleStackView.addArrangedSubview(healthConditionsTitleLabel)
        
        // Health Body Layer Right
        let healthBodyDataStackView = createStackView(axis: .vertical, spacing: 8)
        healthBodyDataStackView.addArrangedSubview(heightDataLabel)
        healthBodyDataStackView.addArrangedSubview(weightDataLabel)
        healthBodyDataStackView.addArrangedSubview(ageDataLabel)
        healthBodyDataStackView.addArrangedSubview(genderDataLabel)
        healthBodyDataStackView.addArrangedSubview(healthConditionsDataLabel)
        
        // Health Body Layer
        healthBodyStackView.addArrangedSubview(healthBodyTitleStackView)
        healthBodyStackView.addArrangedSubview(healthBodyDataStackView)
    }
    
    private func setupFitnessLayerUI(){
        
        // Fitness Header Layer
        fitnessHeaderStackView.spacing = 16
        fitnessHeaderStackView.addArrangedSubview(fitnessTitleLabel)
        fitnessHeaderStackView.addArrangedSubview(editButtonFitness)
        addSubview(fitnessHeaderStackView)
        
        // Fitness Subhead Layer
        addSubview(fitnessSubheadLabel)
        
        // Fitness Body Layer
        fitnessBodyStackView.axis = .horizontal
        fitnessBodyStackView.spacing = 16
        addSubview(fitnessBodyStackView)
        
        // Fitness Body Layer Left
        let fitnessBodyTitleStackView = createStackView(axis: .vertical, spacing: 8)
        fitnessBodyTitleStackView.addArrangedSubview(fitnessGoalTitleLabel)
        fitnessBodyTitleStackView.addArrangedSubview(fitnessLevelTitleLabel)
        
        // Fitness Body Layer Right
        let fitnessBodyDataStackView = createStackView(axis: .vertical, spacing: 8)
        fitnessBodyDataStackView.addArrangedSubview(fitnessGoalDataLabel)
        fitnessBodyDataStackView.addArrangedSubview(fitnessLevelDataLabel)
        
        // Fitness Body Layer
        fitnessBodyStackView.addArrangedSubview(fitnessBodyTitleStackView)
        fitnessBodyStackView.addArrangedSubview(fitnessBodyDataStackView)
    }
    
    private func createStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = .leading
        return stackView
    }
    
    private func createConstraintsAccountLayer() {
        
        tabHeaderTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        tabHeaderCaption.snp.makeConstraints { make in
            make.top.equalTo(tabHeaderTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        // Account Header Layer
        accountHeaderStackView.snp.makeConstraints { make in
            make.top.equalTo(tabHeaderCaption.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Account Subhead Layer
        accountSubheadLabel.snp.makeConstraints { make in
            make.top.equalTo(accountHeaderStackView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Account Body Layer
        accountBodyStackView.snp.makeConstraints { make in
            make.top.equalTo(accountSubheadLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
    }
    
    private func createConstraintsHealthLayer() {
        
        // Health Header Layer
        healthHeaderStackView.snp.makeConstraints { make in
            make.top.equalTo(accountBodyStackView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Health Subhead Layer
        healthSubheadLabel.snp.makeConstraints { make in
            make.top.equalTo(healthHeaderStackView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Health Body Layer
        healthBodyStackView.snp.makeConstraints { make in
            make.top.equalTo(healthSubheadLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
    }
    
    private func createConstraintsFitnessLayer() {
        
        // Fitness Header Layer
        fitnessHeaderStackView.snp.makeConstraints { make in
            make.top.equalTo(healthBodyStackView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Fitness Subhead Layer
        fitnessSubheadLabel.snp.makeConstraints { make in
            make.top.equalTo(fitnessHeaderStackView.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
        
        // Fitness Body Layer
        fitnessBodyStackView.snp.makeConstraints { make in
            make.top.equalTo(fitnessSubheadLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16)
        }
    }
}
