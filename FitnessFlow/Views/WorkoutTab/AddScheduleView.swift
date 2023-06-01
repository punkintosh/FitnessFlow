//
//  AddScheduleView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-28.
//

import UIKit
import SnapKit

class AddScheduleView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let muscleGroupTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let muscleGroupDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let levelTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let levelDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let excersiseNameTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let excersiseNameDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let excersiseRepsTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let excersiseRepsDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let selectDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.contentHorizontalAlignment = .left
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    let createScheduleButton = ButtonWrapper.primaryButton(title: "Create Schedule")
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func configure(workoutLevelExcersiseModel: WorkoutLevelExcersiseModel, level: String, muscleGroup: String) {
        muscleGroupTitleLabel.text = "Muscle Group"
        muscleGroupDataLabel.text = muscleGroup
        levelTitleLabel.text = "Level"
        levelDataLabel.text = level
        excersiseNameTitleLabel.text = "Excersise Name"
        excersiseNameDataLabel.text = workoutLevelExcersiseModel.name
        excersiseRepsTitleLabel.text = "Excersise Reps"
        excersiseRepsDataLabel.text = workoutLevelExcersiseModel.reps
        selectDateLabel.text = "Select Date"
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(muscleGroupTitleLabel)
        contentView.addSubview(muscleGroupDataLabel)
        contentView.addSubview(levelTitleLabel)
        contentView.addSubview(levelDataLabel)
        contentView.addSubview(excersiseNameTitleLabel)
        contentView.addSubview(excersiseNameDataLabel)
        contentView.addSubview(excersiseRepsTitleLabel)
        contentView.addSubview(excersiseRepsDataLabel)
        contentView.addSubview(selectDateLabel)
        contentView.addSubview(datePicker)
        contentView.addSubview(createScheduleButton)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(createScheduleButton.snp.bottom).offset(16)
        }
        
        muscleGroupTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        muscleGroupDataLabel.snp.makeConstraints { make in
            make.top.equalTo(muscleGroupTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        levelTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(muscleGroupDataLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        levelDataLabel.snp.makeConstraints { make in
            make.top.equalTo(levelTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        excersiseNameTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(levelDataLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        excersiseNameDataLabel.snp.makeConstraints { make in
            make.top.equalTo(excersiseNameTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        excersiseRepsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(excersiseNameDataLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        excersiseRepsDataLabel.snp.makeConstraints { make in
            make.top.equalTo(excersiseRepsTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        selectDateLabel.snp.makeConstraints { make in
            make.top.equalTo(excersiseRepsDataLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(selectDateLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        createScheduleButton.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}


