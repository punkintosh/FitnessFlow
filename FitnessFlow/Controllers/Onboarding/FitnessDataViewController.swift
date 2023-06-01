//
//  FitnessDataViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import UIKit
import SnapKit
import MBProgressHUD

class FitnessDataViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private let fitnessDataView: FitnessDataView
    
    private let userAccountModel: UserAccountModel
    private let userHealthModel: UserHealthModel
    
    var selectedDays: [String] = [] // Store the selected days
    
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
        
        fitnessDataView.weeklyGoalCollectionView.delegate = self
        fitnessDataView.weeklyGoalCollectionView.dataSource = self
        fitnessDataView.weeklyGoalCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
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
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7 // Number of days in a week
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .lightGray // Set the desired background color
        
        let dayLabel = UILabel()
        dayLabel.text = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][indexPath.item] // Set the day label text
        dayLabel.textAlignment = .center
        dayLabel.textColor = .white // Set the desired text color
        dayLabel.font = UIFont.systemFont(ofSize: 16) // Set the desired font
        
        cell.contentView.addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedDay = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"][indexPath.item]
        selectedDays.append(selectedDay)
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .darkGray // Set the selected background color
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let deselectedDay = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"][indexPath.item]
        if let index = selectedDays.firstIndex(of: deselectedDay) {
            selectedDays.remove(at: index)
        }
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .lightGray // Set the deselected background color
    }

    
    @objc private func continueButtonTapped() {
        let fitnessGoalIndex = fitnessDataView.fitnessGoalSegmentedControl.selectedSegmentIndex
        let fitnessGoal = fitnessDataView.fitnessGoalSegmentedControl.titleForSegment(at: fitnessGoalIndex) ?? ""
        
        let fitnessLevelIndex = fitnessDataView.fitnessLevelSegmentedControl.selectedSegmentIndex
        let fitnessLevel = fitnessDataView.fitnessLevelSegmentedControl.titleForSegment(at: fitnessLevelIndex) ?? ""
        
        let userFitnessModel = UserFitnessModel(fitnessGoal: fitnessGoal, fitnessLevel: fitnessLevel, weeklyGoal: selectedDays, updated: DateTimeHelper().getCurrentDateTime)
        
//        saveDataToFirestore(userFitnessModel: userFitnessModel)
        print(userFitnessModel)
        
        // let formValidator = FormValidator()
        // TODO: Validate button press later
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd:HH:mm:ss"
//        let dateTimeNow = dateFormatter.string(from: Date())
        
//        let userFitnessModel = UserFitnessModel(fitnessGoal: fitnessGoal, fitnessLevel: fitnessLevel, weeklyGoal: weeklyGoal, updated: dateTimeNow)
        
        
        // Navigate to CreateAccountViewController
        let userModel = UserModel(firstName: userAccountModel.firstName, lastName: userAccountModel.lastName, email: userAccountModel.email, password: userAccountModel.password, height: userHealthModel.height, weight: userHealthModel.weight, age: userHealthModel.age, gender: userHealthModel.gender, healthConditions: userHealthModel.healthConditions, fitnessGoal: fitnessGoal, fitnessLevel: fitnessLevel, weeklyGoal: selectedDays, created: DateTimeHelper().getCurrentDateTime, updated: DateTimeHelper().getCurrentDateTime)
        
            print("---------- Fitness Details ----------")
            print("Fitness Goal: ", fitnessGoal)
            print("Fitness Level: ", fitnessLevel)
            print("Weekly Goal: ", selectedDays)
        
        let nextViewController = CreateAccountViewController(userModel: userModel)
        navigationController?.pushViewController(nextViewController, animated: true)
        


    }
    
}


