//
//  AddHealthDetailsViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit
import MBProgressHUD

class AddHealthDetailsViewController: UIViewController {
    private let addHealthDetailsView: AddHealthDetailsView
    let currentUserID = AuthService.currentUser?.uid
    
    init() {
        self.addHealthDetailsView = AddHealthDetailsView()
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
        view.addSubview(addHealthDetailsView)
        
        // Title
        title = "Add Health Details"
        
        addHealthDetailsView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        addHealthDetailsView.saveInfoButton.addTarget(self, action: #selector(saveInfoButtonTapped), for: .touchUpInside)
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

    
    @objc private func saveInfoButtonTapped() {
        let height = addHealthDetailsView.heightTextField.text ?? ""
        let weight = addHealthDetailsView.weightTextField.text ?? ""
        let genderIndex = addHealthDetailsView.genderSegmentedControl.selectedSegmentIndex
        let gender = addHealthDetailsView.genderSegmentedControl.titleForSegment(at: genderIndex) ?? ""
        let age = addHealthDetailsView.ageTextField.text ?? ""
        let healthConditions = addHealthDetailsView.healthConditionsTextField.text?
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
            saveDataToFirestore(userHealthModel: userHealthModel)
        } else {
            print("Invalid age value")
        }
    }
    
    private func saveDataToFirestore(userHealthModel: UserHealthModel) {
        print("---------- User Health Details ----------")
        print("Height: \(userHealthModel.height)")
        print("Weight: \(userHealthModel.weight)")
        print("Age: \(userHealthModel.age)")
        print("Gender: \(userHealthModel.gender)")
        print("Health Conditions: \(userHealthModel.healthConditions)")
        
        let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        progressHUD.label.text = "Saving..."
        
        UserHealthService.shared.createUserHealthDocument(userID: currentUserID!, healthData: userHealthModel) { result in
            DispatchQueue.main.async {
                progressHUD.hide(animated: true)
                
                switch result {
                case .success:
                    print("User health data saved in Firestore")
                    CAlert.showAlert(on: self, title: "Details Saved", message: "Your data has been added!")
                case .failure(let error):
                    print("Failed to save user health data in Firestore:", error)
                    // Handle the error appropriately
                }
            }
        }
    }
    
}
