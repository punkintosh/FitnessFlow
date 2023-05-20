//
//  HealthDataViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import UIKit
import SnapKit
import MBProgressHUD

class HealthDataViewController: UIViewController {
    private let healthDataView: HealthDataView
    
    private let userAccountModel: UserAccountModel
    
    init(userAccountModel: UserAccountModel) {
        self.userAccountModel = userAccountModel
        self.healthDataView = HealthDataView()
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
        view.addSubview(healthDataView)
        
        // Title
        title = "Add Health Details"
        
        healthDataView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        healthDataView.continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
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
        let height = healthDataView.heightTextField.text ?? ""
        let weight = healthDataView.weightTextField.text ?? ""
        let genderIndex = healthDataView.genderSegmentedControl.selectedSegmentIndex
        let gender = healthDataView.genderSegmentedControl.titleForSegment(at: genderIndex) ?? ""
        let age = healthDataView.ageTextField.text ?? ""
        let healthConditions = healthDataView.healthConditionsTextField.text?
            .components(separatedBy: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) } ?? []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd:HH:mm:ss"
        let dateTimeNow = dateFormatter.string(from: Date())
        
        // let formValidator = FormValidator()
        // TODO: Validate button press later
        
        var heightValue: Double = 0.0
        if let heightDoubleValue = Double(height) {
            heightValue = heightDoubleValue
        } else if let heightIntValue = Int(height) {
            heightValue = Double(heightIntValue)
        } else {
            print("Invalid height value")
            return
        }
        
        var weightValue: Double = 0.0
        if let weightDoubleValue = Double(weight) {
            weightValue = weightDoubleValue
        } else if let weightIntValue = Int(weight) {
            weightValue = Double(weightIntValue)
        } else {
            print("Invalid weight value")
            return
        }
        
        if let ageValue = Int(age) {
            let userHealthModel = UserHealthModel(height: heightValue, weight: weightValue, age: ageValue, gender: gender, healthConditions: healthConditions, updated: dateTimeNow)
            print("---------- Health Details ----------")
            print("Height: ", userHealthModel.height)
            print("Weight: ", userHealthModel.weight)
            print("Age: ", userHealthModel.age)
            print("Gender: ", userHealthModel.gender)
            print("Health Conditions: ", userHealthModel.healthConditions)
            
            // Navigate to FitnessDataViewController
            let nextViewController = FitnessDataViewController(userAccountModel: userAccountModel, userHealthModel: userHealthModel)
            navigationController?.pushViewController(nextViewController, animated: true)
            
        } else {
            print("Invalid age value")
        }
    }
    
}
