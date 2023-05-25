//
//  UpdateFitnessDetailsView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import UIKit
import SnapKit

class UpdateFitnessDetailsView: UIView {
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
    
    
    let updateInfoButton: CRoundedButton = {
        let button = CRoundedButton(title: "Update Details")
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func configure(userFitnessModel: UserFitnessModel) {
        fitnessGoal.text = "Fitness Goal"
        fitnessLevel.text = "Fitness Level"
        weeklyGoalLabel.text = "Weekly Goal"
        
        if userFitnessModel.fitnessGoal == "Weight Loss" {
            fitnessGoalSegmentedControl.selectedSegmentIndex = 0
        } else if userFitnessModel.fitnessGoal == "Muscle Building" {
            fitnessGoalSegmentedControl.selectedSegmentIndex = 1
        } else {
            fitnessGoalSegmentedControl.selectedSegmentIndex = 2
        }
        
        if userFitnessModel.fitnessLevel == "Beginner" {
            fitnessLevelSegmentedControl.selectedSegmentIndex = 0
        } else if userFitnessModel.fitnessLevel == "Intermediate" {
            fitnessLevelSegmentedControl.selectedSegmentIndex = 1
        } else {
            fitnessLevelSegmentedControl.selectedSegmentIndex = 2
        }
        // Set the selected days in the collection view
            for (index, day) in ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"].enumerated() {
                if userFitnessModel.weeklyGoal.contains(day) {
                    let indexPath = IndexPath(item: index, section: 0)
                    weeklyGoalCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
                }
            }
    }
    
    private func setupUI() {
        addSubview(fitnessGoal)
        addSubview(fitnessLevel)
        addSubview(weeklyGoalLabel)
        addSubview(fitnessGoalSegmentedControl)
        addSubview(fitnessLevelSegmentedControl)
        addSubview(weeklyGoalCollectionView)
        addSubview(updateInfoButton)
    
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
        
        updateInfoButton.snp.makeConstraints { make in
            make.top.equalTo(weeklyGoalCollectionView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
}

