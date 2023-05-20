//
//  FitnessDataView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import UIKit
import SnapKit

class FitnessDataView: UIView {
    let fitnessGoal = CLabel.iOSSubhead()
    let fitnessLevel = CLabel.iOSSubhead()
    let weeklyGoalLabel = CLabel.iOSSubhead()
    
    let fitnessGoalSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Weight Loss", "Muscle Building", "Stay Fit"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    let fitnessLevelSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Beginner", "Intermediate", "Advanced"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    let weeklyGoalSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["1", "2", "3", "4", "5", "6", "7"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    
    let continueButton: CRoundedButton = {
        let button = CRoundedButton(title: "Continue")
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configure()
    }
    
    private func configure() {
        fitnessGoal.text = "Fitness Goal"
        fitnessLevel.text = "Fitness Level"
        weeklyGoalLabel.text = "Weekly Goal"
    }
    
    private func setupUI() {
        addSubview(fitnessGoal)
        addSubview(fitnessLevel)
        addSubview(weeklyGoalLabel)
        addSubview(fitnessGoalSegmentedControl)
        addSubview(fitnessLevelSegmentedControl)
        addSubview(weeklyGoalSegmentedControl)
        addSubview(continueButton)
    
        fitnessGoal.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        fitnessGoalSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(fitnessGoal.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        fitnessLevel.snp.makeConstraints { make in
            make.top.equalTo(fitnessGoalSegmentedControl.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        fitnessLevelSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(fitnessLevel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        weeklyGoalLabel.snp.makeConstraints { make in
            make.top.equalTo(fitnessLevelSegmentedControl.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        weeklyGoalSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(weeklyGoalLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(weeklyGoalSegmentedControl.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
}


