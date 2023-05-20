//
//  AddHealthDetailsView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class AddHealthDetailsView: UIView {
    let heightLabel = CLabelTextField(text: "Height (cm)")
    let weightLabel = CLabelTextField(text: "Weight (Kg)")
    let genderLabel = CLabelTextField(text: "Gender")
    let ageLabel = CLabelTextField(text: "Age (Years)")
    let healthConditionsLabel = CLabelTextField(text: "Health Conditions")
    
    let heightTextField = CTextField(placeholder: "174")
    let weightTextField = CTextField(placeholder: "80")
    let ageTextField = CTextField(placeholder: "24")
    let healthConditionsTextField = CTextField(placeholder: "Muscle pain, Knee pain, etc.")
    
    let genderSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male", "Female"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    var healthConditions: [String] = []
//    let healthConditionsTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Health Conditions"
//        textField.borderStyle = .roundedRect
//        return textField
//    }()
    
    let saveInfoButton: CRoundedButton = {
        let button = CRoundedButton(title: "Save Details")
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
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
        addSubview(saveInfoButton)
    
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
        
        saveInfoButton.snp.makeConstraints { make in
            make.top.equalTo(healthConditionsTextField.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
}
