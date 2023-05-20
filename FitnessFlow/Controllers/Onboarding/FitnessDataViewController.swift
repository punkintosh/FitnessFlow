//
//  FitnessDataViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import UIKit
import SnapKit
import MBProgressHUD

class FitnessDataViewController: UIViewController {
    private let fitnessDataView: FitnessDataView
    
    private let userAccountModel: UserAccountModel
    private let userHealthModel: UserHealthModel
    
    init(userAccountModel: UserAccountModel, userHealthModel: UserHealthModel) {
        self.userAccountModel = userAccountModel
        self.userHealthModel = userHealthModel
        self.fitnessDataView = FitnessDataView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        customizeNavigationBar()
        customizeNavigationBarBackButton()
        setupBindings()
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(fitnessDataView)
        
        // Title
        title = "Add Fitness Details"
        
        fitnessDataView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        fitnessDataView.continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    private func customizeNavigationBar() {
        let customFont = AppThemeData.fontSizeHeadline ?? UIFont.systemFont(ofSize: 20)
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: customFont,
            NSAttributedString.Key.foregroundColor: AppThemeData.colorTextDarkGray
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    private func customizeNavigationBarBackButton() {
        // Back Button
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = AppThemeData.colorTextDarkGray
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: AppThemeData.fontSizeTextButton!,
            NSAttributedString.Key.foregroundColor: AppThemeData.colorTextDarkGray
        ]
        backButton.setTitleTextAttributes(attributes, for: .normal)
    }

    
    @objc private func continueButtonTapped() {
        let fitnessGoalIndex = fitnessDataView.fitnessGoalSegmentedControl.selectedSegmentIndex
        let fitnessGoal = fitnessDataView.fitnessGoalSegmentedControl.titleForSegment(at: fitnessGoalIndex) ?? ""
        
        let fitnessLevelIndex = fitnessDataView.fitnessLevelSegmentedControl.selectedSegmentIndex
        let fitnessLevel = fitnessDataView.fitnessLevelSegmentedControl.titleForSegment(at: fitnessLevelIndex) ?? ""
        
        let weeklyGoalIndex = fitnessDataView.weeklyGoalSegmentedControl.selectedSegmentIndex
        let weeklyGoal = fitnessDataView.weeklyGoalSegmentedControl.titleForSegment(at: weeklyGoalIndex) ?? ""
        
        // let formValidator = FormValidator()
        // TODO: Validate button press later
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd:HH:mm:ss"
        let dateTimeNow = dateFormatter.string(from: Date())
        
//        let userFitnessModel = UserFitnessModel(fitnessGoal: fitnessGoal, fitnessLevel: fitnessLevel, weeklyGoal: weeklyGoal, updated: dateTimeNow)
        
        
        // Navigate to CreateAccountViewController
        let userModel = UserModel(firstName: userAccountModel.firstName, lastName: userAccountModel.lastName, email: userAccountModel.email, password: userAccountModel.password, height: userHealthModel.height, weight: userHealthModel.weight, age: userHealthModel.age, gender: userHealthModel.gender, healthConditions: userHealthModel.healthConditions, fitnessGoal: fitnessGoal, fitnessLevel: fitnessLevel, weeklyGoal: weeklyGoal)
        
            print("---------- Fitness Details ----------")
            print("Fitness Goal: ", fitnessGoal)
            print("Fitness Level: ", fitnessLevel)
            print("Weekly Goal: ", weeklyGoal)
        
        let nextViewController = CreateAccountViewController(userModel: userModel)
        navigationController?.pushViewController(nextViewController, animated: true)
        


    }
    
}


