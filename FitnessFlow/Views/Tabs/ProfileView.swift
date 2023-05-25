//
//  ProfileView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let tabHeaderTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    let tabHeaderCaption: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppThemeData.colorTextLightGray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    // MARK: Account
    
    // Header
    let accountTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        return label
    }()

    let editButtonAccount: CTextButton = {
        let button = CTextButton(text: "Edit", color: AppThemeData.colorTextPrimary)
        return button
    }()
    
    // Titles
    let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    let emailTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    let createdTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    let updatedTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    // Data
    let nameDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    let emailDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    let createdDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    let updatedDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    // MARK: Health
    
    // Header
    let healthTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        return label
    }()

    let editButtonHealth: CTextButton = {
        let button = CTextButton(text: "Edit", color: AppThemeData.colorTextPrimary)
        return button
    }()
    
    // Titles
    let heightTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    let weightTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    let ageTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    let genderTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    let healthConditionsTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    // Data
    let heightDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    let weightDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    let ageDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    let genderDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    let healthConditionsDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    // MARK: Fitness
    
    // Header
    let fitnessTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        return label
    }()

    let editButtonFitness: CTextButton = {
        let button = CTextButton(text: "Edit", color: AppThemeData.colorTextPrimary)
        return button
    }()
    
    // Titles
    let fitnessGoalTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    let fitnessLevelTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    let weeklyGoalTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    // Data
    let fitnessGoalDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    let fitnessLevelDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    let weeklyGoalDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    // Sign Out
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
    
    func configure(userModel: UserModel) {
        tabHeaderTitle.text = "Profile"
        tabHeaderCaption.text = "Manage your health data"
        
        // MARK: Account
        accountTitleLabel.text = "Account Details"
        nameTitleLabel.text = "Name"
        emailTitleLabel.text = "Email"
        createdTitleLabel.text = "Created"
        updatedTitleLabel.text = "Updated"
        nameDataLabel.text = userModel.firstName + " " + userModel.lastName
        emailDataLabel.text = userModel.email
        createdDataLabel.text = userModel.created
        updatedDataLabel.text = userModel.updated
        
        // MARK: Health
        healthTitleLabel.text = "Health Details"
        heightTitleLabel.text = "Height"
        weightTitleLabel.text = "Weight"
        ageTitleLabel.text = "Age"
        genderTitleLabel.text = "Gender"
        healthConditionsTitleLabel.text = "Health Conditions"
        heightDataLabel.text = "\(userModel.height)"
        weightDataLabel.text = "\(userModel.weight)"
        ageDataLabel.text = "\(userModel.age)"
        genderDataLabel.text = userModel.gender
        if userModel.healthConditions.count == 1 && userModel.healthConditions[0] == "" {
            healthConditionsDataLabel.text = "0"
        } else {
            healthConditionsDataLabel.text = "\(userModel.healthConditions.count)"
        }
        
        // MARK: Fitness
        fitnessTitleLabel.text = "Fitness Details"
        fitnessGoalTitleLabel.text = "Fitness Goal"
        fitnessLevelTitleLabel.text = "Fitness Level"
        weeklyGoalTitleLabel.text = "Weekly Goal"
        fitnessGoalDataLabel.text = userModel.fitnessGoal
        fitnessLevelDataLabel.text = userModel.fitnessLevel
        weeklyGoalDataLabel.text = "\(userModel.weeklyGoal.count)"
    }
    
    
    private func setupUI() {
        
        // MARK: Account
        
        let accountStackViewHeader = UIStackView()
        accountStackViewHeader.axis = .horizontal
        accountStackViewHeader.alignment = .center
        accountStackViewHeader.spacing = 8
        accountStackViewHeader.addArrangedSubview(accountTitleLabel)
        accountStackViewHeader.addArrangedSubview(editButtonAccount)
        
        let accountStackViewtitles = UIStackView()
        accountStackViewtitles.axis = .vertical
        accountStackViewtitles.alignment = .leading
        accountStackViewtitles.spacing = 8
        accountStackViewtitles.addArrangedSubview(nameTitleLabel)
        accountStackViewtitles.addArrangedSubview(emailTitleLabel)
        accountStackViewtitles.addArrangedSubview(createdTitleLabel)
        accountStackViewtitles.addArrangedSubview(updatedTitleLabel)
        
        let accountStackViewdata = UIStackView()
        accountStackViewdata.axis = .vertical
        accountStackViewdata.alignment = .trailing
        accountStackViewdata.spacing = 8
        accountStackViewdata.addArrangedSubview(nameDataLabel)
        accountStackViewdata.addArrangedSubview(emailDataLabel)
        accountStackViewdata.addArrangedSubview(createdDataLabel)
        accountStackViewdata.addArrangedSubview(updatedDataLabel)
        
        // MARK: Health
        let healthStackViewHeader = UIStackView()
        healthStackViewHeader.axis = .horizontal
        healthStackViewHeader.alignment = .center
        healthStackViewHeader.spacing = 8
        healthStackViewHeader.addArrangedSubview(healthTitleLabel)
        healthStackViewHeader.addArrangedSubview(editButtonHealth)

        let healthStackViewTitles = UIStackView()
        healthStackViewTitles.axis = .vertical
        healthStackViewTitles.alignment = .leading
        healthStackViewTitles.spacing = 8
        healthStackViewTitles.addArrangedSubview(heightTitleLabel)
        healthStackViewTitles.addArrangedSubview(weightTitleLabel)
        healthStackViewTitles.addArrangedSubview(ageTitleLabel)
        healthStackViewTitles.addArrangedSubview(genderTitleLabel)
        healthStackViewTitles.addArrangedSubview(healthConditionsTitleLabel)

        let healthStackViewData = UIStackView()
        healthStackViewData.axis = .vertical
        healthStackViewData.alignment = .trailing
        healthStackViewData.spacing = 8
        healthStackViewData.addArrangedSubview(heightDataLabel)
        healthStackViewData.addArrangedSubview(weightDataLabel)
        healthStackViewData.addArrangedSubview(ageDataLabel)
        healthStackViewData.addArrangedSubview(genderDataLabel)
        healthStackViewData.addArrangedSubview(healthConditionsDataLabel)
        
        // MARK: Fitness
        let fitnessStackViewHeader = UIStackView()
        fitnessStackViewHeader.axis = .horizontal
        fitnessStackViewHeader.alignment = .center
        fitnessStackViewHeader.spacing = 8
        fitnessStackViewHeader.addArrangedSubview(fitnessTitleLabel)
        fitnessStackViewHeader.addArrangedSubview(editButtonFitness)

        let fitnessStackViewTitles = UIStackView()
        fitnessStackViewTitles.axis = .vertical
        fitnessStackViewTitles.alignment = .leading
        fitnessStackViewTitles.spacing = 8
        fitnessStackViewTitles.addArrangedSubview(fitnessGoalTitleLabel)
        fitnessStackViewTitles.addArrangedSubview(fitnessLevelTitleLabel)
        fitnessStackViewTitles.addArrangedSubview(weeklyGoalTitleLabel)

        let fitnessStackViewData = UIStackView()
        fitnessStackViewData.axis = .vertical
        fitnessStackViewData.alignment = .trailing
        fitnessStackViewData.spacing = 8
        fitnessStackViewData.addArrangedSubview(fitnessGoalDataLabel)
        fitnessStackViewData.addArrangedSubview(fitnessLevelDataLabel)
        fitnessStackViewData.addArrangedSubview(weeklyGoalDataLabel)
        
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tabHeaderTitle)
        contentView.addSubview(tabHeaderCaption)
        contentView.addSubview(accountStackViewHeader)
        contentView.addSubview(accountStackViewtitles)
        contentView.addSubview(accountStackViewdata)
        contentView.addSubview(healthStackViewHeader)
        contentView.addSubview(healthStackViewTitles)
        contentView.addSubview(healthStackViewData)
        contentView.addSubview(fitnessStackViewHeader)
        contentView.addSubview(fitnessStackViewTitles)
        contentView.addSubview(fitnessStackViewData)
        contentView.addSubview(signOutButton)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(signOutButton.snp.bottom).offset(16)
        }
        
        tabHeaderTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        tabHeaderCaption.snp.makeConstraints { make in
            make.top.equalTo(tabHeaderTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        // MARK: Account
        accountStackViewHeader.snp.makeConstraints { make in
            make.top.equalTo(tabHeaderCaption.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        editButtonAccount.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(accountTitleLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
        }

        accountStackViewtitles.snp.makeConstraints { make in
            make.top.equalTo(accountStackViewHeader.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        accountStackViewdata.snp.makeConstraints { make in
            make.top.equalTo(accountStackViewtitles)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalTo(accountStackViewtitles.snp.trailing).offset(16)
        }
        
        // MARK: Health
        healthStackViewHeader.snp.makeConstraints { make in
            make.top.equalTo(accountStackViewdata.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        editButtonHealth.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(healthTitleLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
        }

        healthStackViewTitles.snp.makeConstraints { make in
            make.top.equalTo(healthStackViewHeader.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }

        healthStackViewData.snp.makeConstraints { make in
            make.top.equalTo(healthStackViewTitles)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalTo(healthStackViewTitles.snp.trailing).offset(16)
        }
        
        // MARK: Fitness
        fitnessStackViewHeader.snp.makeConstraints { make in
            make.top.equalTo(healthStackViewData.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        editButtonFitness.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(fitnessTitleLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
        }

        fitnessStackViewTitles.snp.makeConstraints { make in
            make.top.equalTo(fitnessStackViewHeader.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }

        fitnessStackViewData.snp.makeConstraints { make in
            make.top.equalTo(fitnessStackViewTitles)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalTo(fitnessStackViewTitles.snp.trailing).offset(16)
        }
        
        signOutButton.snp.makeConstraints { make in
            make.top.equalTo(fitnessStackViewTitles.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
}
