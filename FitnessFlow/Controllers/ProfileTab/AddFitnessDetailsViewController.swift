//
//  AddFitnessDetailsViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import UIKit
import SnapKit
import MBProgressHUD

class AddFitnessDetailsViewController: UIViewController {
    private let addfitnessDetailsView: AddFitnessDetailsView
    let currentUserID = AuthService.currentUser?.uid
    
    init() {
        self.addfitnessDetailsView = AddFitnessDetailsView()
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
        view.addSubview(addfitnessDetailsView)
        
        // Title
        title = "Add Fitness Details"
        
        addfitnessDetailsView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        addfitnessDetailsView.saveInfoButton.addTarget(self, action: #selector(saveInfoButtonTapped), for: .touchUpInside)
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
        let fitnessGoalIndex = addfitnessDetailsView.fitnessGoalSegmentedControl.selectedSegmentIndex
        let fitnessGoal = addfitnessDetailsView.fitnessGoalSegmentedControl.titleForSegment(at: fitnessGoalIndex) ?? ""
        
        let fitnessLevelIndex = addfitnessDetailsView.fitnessLevelSegmentedControl.selectedSegmentIndex
        let fitnessLevel = addfitnessDetailsView.fitnessLevelSegmentedControl.titleForSegment(at: fitnessLevelIndex) ?? ""
        
        let weeklyGoalIndex = addfitnessDetailsView.weeklyGoalSegmentedControl.selectedSegmentIndex
        let weeklyGoal = addfitnessDetailsView.weeklyGoalSegmentedControl.titleForSegment(at: weeklyGoalIndex) ?? ""
        
        // let formValidator = FormValidator()
        // TODO: Validate button press later
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd:HH:mm:ss"
        let dateTimeNow = dateFormatter.string(from: Date())
        
        let userFitnessModel = UserFitnessModel(fitnessGoal: fitnessGoal, fitnessLevel: fitnessLevel, weeklyGoal: weeklyGoal, updated: dateTimeNow)
        saveDataToFirestore(userFitnessModel: userFitnessModel)

    }
    
    private func saveDataToFirestore(userFitnessModel: UserFitnessModel) {
        print("---------- User Fitness Details ----------")
        print("Fitness Goal: \(userFitnessModel.fitnessGoal)")
        print("Fitness Level: \(userFitnessModel.fitnessLevel)")
        print("Weekly Goal: \(userFitnessModel.weeklyGoal)")
        
        let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        progressHUD.label.text = "Saving..."
        
        UserFitnessService.shared.createUserHealthDocument(userID: currentUserID!, fitnessData: userFitnessModel) { result in
            DispatchQueue.main.async {
                progressHUD.hide(animated: true)
                
                switch result {
                case .success:
                    print("User fitness data saved in Firestore")
                    CAlert.showAlert(on: self, title: "Details Saved", message: "Your data has been added!")
                case .failure(let error):
                    print("Failed to save user fitness data in Firestore:", error)
                    // Handle the error appropriately
                }
            }
        }
    }
    
}

