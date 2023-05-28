//
//  UpdateHealthDetailsView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class UpdateHealthDetailsView: UIView {
    let heightLabel = LabelWrapper.subheadline()
    let weightLabel = LabelWrapper.subheadline()
    let genderLabel = LabelWrapper.subheadline()
    let ageLabel = LabelWrapper.subheadline()
    let healthConditionsLabel = LabelWrapper.subheadline()
    
    let heightTextField = TextFieldWrapper.standardTextField(placeholder: "174")
    let weightTextField = TextFieldWrapper.standardTextField(placeholder: "80")
    let ageTextField = TextFieldWrapper.standardTextField(placeholder: "24")
    let healthConditionsTextField = TextFieldWrapper.standardTextField(placeholder: "Muscle pain, Knee pain, etc.")
    
    let genderSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male", "Female"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    var healthConditions: [String] = []
    
    let updateInfoButton = ButtonWrapper.primaryButton(title: "Update Details")
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func configure(userHealthModel: UserHealthModel) {
        heightLabel.text = "Height (cm)"
        weightLabel.text = "Weight (Kg)"
        genderLabel.text = "Gender"
        ageLabel.text = "Age (Years)"
        healthConditionsLabel.text = "Health Conditions"
        
        heightTextField.text = String(userHealthModel.height)
        weightTextField.text = String(userHealthModel.weight)
        ageTextField.text = String(userHealthModel.age)
        healthConditionsTextField.text = userHealthModel.healthConditions.joined(separator: ", ")
        
        if userHealthModel.gender == "Female" {
            genderSegmentedControl.selectedSegmentIndex = 1
        } else {
            genderSegmentedControl.selectedSegmentIndex = 0
        }
    }
    
    private func setupUI() {
        addSubview(heightLabel)
        addSubview(weightLabel)
        addSubview(genderLabel)
        addSubview(ageLabel)
        addSubview(heightTextField)
        addSubview(weightTextField)
        addSubview(genderSegmentedControl)
        addSubview(ageTextField)
        addSubview(healthConditionsLabel)
        addSubview(healthConditionsTextField)
        addSubview(updateInfoButton)
    
        heightLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        heightTextField.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(heightTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        weightTextField.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(weightTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        genderSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(genderSegmentedControl.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        ageTextField.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        healthConditionsLabel.snp.makeConstraints { make in
            make.top.equalTo(ageTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        healthConditionsTextField.snp.makeConstraints { make in
            make.top.equalTo(healthConditionsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        updateInfoButton.snp.makeConstraints { make in
            make.top.equalTo(healthConditionsTextField.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
}
