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
    
    let weeklyGoalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.allowsMultipleSelection = true
        collectionView.backgroundColor = .clear
        return collectionView
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
        addSubview(weeklyGoalCollectionView)
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
        
        weeklyGoalCollectionView.snp.makeConstraints { make in
            make.top.equalTo(weeklyGoalLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(150) // Set the desired height for the collection view
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(weeklyGoalCollectionView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
}


