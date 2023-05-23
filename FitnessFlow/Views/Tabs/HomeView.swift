//
//  HomeView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let greetingsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextPrimary
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let motivationalQuoteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    let profileSummaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let bmiLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let bmiStatusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let fitnessGoalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let fitnessLevelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let weeklyGoalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let workoutSummaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let totalCaloriesBurnedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let completedWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func configure(userModel: UserModel) {
        titleLabel.text = "FitnessFlow | Home"
        let currentTimePeriod = GreetingHelper.getCurrentTimePeriod()
        let currentMood = GreetingHelper.getCurrentMood()
        greetingsLabel.text = "\(currentTimePeriod), \(currentMood)!"
        userNameLabel.text = userModel.firstName + " " + userModel.lastName
        motivationalQuoteLabel.text = "\"Success is not final, failure is not fatal: It is the courage to continue that counts.\""
        
        profileSummaryLabel.text = "Profile Summary"
        heightLabel.text = "Height: \(userModel.height)"
        weightLabel.text = "Weight: \(userModel.weight)"
        let bmiValue = BMIHelper().calculateBMI(height: userModel.height, weight: userModel.weight)
        let bmiStatus = "Not Defined";
        bmiLabel.text = "Current BMI: \(bmiValue)"
        bmiLabel.text = "BMI Status: \(bmiStatus)"
        fitnessGoalLabel.text = "Fitness Goal: \(userModel.fitnessGoal)"
        fitnessLevelLabel.text = "Fitness Level: \(userModel.fitnessLevel)"
        weeklyGoalLabel.text = "Weekly Goal: \(userModel.weeklyGoal)"
        
        workoutSummaryLabel.text = "Workout Summary"
        totalCaloriesBurnedLabel.text = "Total Calories Burned: 0"
        completedWorkoutsLabel.text = "Completed Workouts: 0"
    }
    
    // Update BMI
    func updateBMIValue(height: Double, weight: Double) {
        let bmiValue = BMIHelper().calculateBMI(height: height, weight: weight)
        let bmiStatus = BMIHelper().getBMIStatus(bmiValue: bmiValue)
        bmiLabel.text = "Current BMI: \(bmiValue)"
        bmiStatusLabel.text = "BMI Status: \(bmiStatus)"
    }

    private func setupUI() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(greetingsLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(motivationalQuoteLabel)
        contentView.addSubview(profileSummaryLabel)
        contentView.addSubview(heightLabel)
        contentView.addSubview(weightLabel)
        contentView.addSubview(bmiLabel)
        contentView.addSubview(bmiStatusLabel)
        contentView.addSubview(fitnessGoalLabel)
        contentView.addSubview(fitnessLevelLabel)
        contentView.addSubview(weeklyGoalLabel)
        contentView.addSubview(workoutSummaryLabel)
        contentView.addSubview(completedWorkoutsLabel)
        contentView.addSubview(totalCaloriesBurnedLabel)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(completedWorkoutsLabel.snp.bottom).offset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        greetingsLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingsLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        motivationalQuoteLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        profileSummaryLabel.snp.makeConstraints { make in
            make.top.equalTo(motivationalQuoteLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(profileSummaryLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        bmiLabel.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        bmiStatusLabel.snp.makeConstraints { make in
            make.top.equalTo(bmiLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        fitnessGoalLabel.snp.makeConstraints { make in
            make.top.equalTo(bmiStatusLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        fitnessLevelLabel.snp.makeConstraints { make in
            make.top.equalTo(fitnessGoalLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        weeklyGoalLabel.snp.makeConstraints { make in
            make.top.equalTo(fitnessLevelLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        workoutSummaryLabel.snp.makeConstraints { make in
            make.top.equalTo(weeklyGoalLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        totalCaloriesBurnedLabel.snp.makeConstraints { make in
            make.top.equalTo(workoutSummaryLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        completedWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(totalCaloriesBurnedLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}

