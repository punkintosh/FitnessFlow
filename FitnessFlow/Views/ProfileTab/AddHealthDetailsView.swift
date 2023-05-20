//
//  AddHealthDetailsView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class AddHealthDetailsView: UIView {
    let heightLabel = CLabelTextField(text: "Height")
    let weightLabel = CLabelTextField(text: "Weight")
    
    let heightTextField = CTextField(placeholder: "Height")
    let weightTextField = CTextField(placeholder: "Weight")
    
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
        addSubview(heightTextField)
        addSubview(weightTextField)
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
        
        saveInfoButton.snp.makeConstraints { make in
            make.top.equalTo(weightTextField.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
    }
}
