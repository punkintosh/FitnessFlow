//
//  UpdateFitnessDetailsViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import UIKit
import SnapKit
import MBProgressHUD

class UpdateFitnessDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private let updatefitnessDetailsView: UpdateFitnessDetailsView
    let currentUserID = AuthService.currentUser?.uid
    var selectedDays: [String] = [] // Store the selected days
    private let userFitnessModel: UserFitnessModel
    
    init(userFitnessModel: UserFitnessModel) {
        self.userFitnessModel = userFitnessModel
        print(userFitnessModel)
        self.updatefitnessDetailsView = UpdateFitnessDetailsView()
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
        updatefitnessDetailsView.configure(userFitnessModel: userFitnessModel)
        
        updatefitnessDetailsView.weeklyGoalCollectionView.delegate = self
        updatefitnessDetailsView.weeklyGoalCollectionView.dataSource = self
        updatefitnessDetailsView.weeklyGoalCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        selectDefaultDays()
    }
    
    private func selectDefaultDays() {
        for (index, day) in ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"].enumerated() {
            if userFitnessModel.weeklyGoal.contains(day) {
                let indexPath = IndexPath(item: index, section: 0)
                updatefitnessDetailsView.weeklyGoalCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
                selectedDays.append(day)
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(updatefitnessDetailsView)
        
        // Title
        title = "Update Fitness Details"
        
        updatefitnessDetailsView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        updatefitnessDetailsView.updateInfoButton.addTarget(self, action: #selector(updateInfoButtonTapped), for: .touchUpInside)
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
        cell.backgroundColor = .lightGray // Set the default background color
        
        let dayLabel = UILabel()
        dayLabel.text = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][indexPath.item] // Set the day label text
        dayLabel.textAlignment = .center
        dayLabel.textColor = .white // Set the desired text color
        dayLabel.font = UIFont.systemFont(ofSize: 16) // Set the desired font
        
        cell.contentView.addSubview(dayLabel)
        dayLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Check if the day is selected and update the cell's background color accordingly
        let selectedDay = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"][indexPath.item]
        if userFitnessModel.weeklyGoal.contains(selectedDay) {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
            cell.backgroundColor = .darkGray // Set the selected background color
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
    
    @objc private func updateInfoButtonTapped() {
        let fitnessGoalIndex = updatefitnessDetailsView.fitnessGoalSegmentedControl.selectedSegmentIndex
        let fitnessGoal = updatefitnessDetailsView.fitnessGoalSegmentedControl.titleForSegment(at: fitnessGoalIndex) ?? ""
        
        let fitnessLevelIndex = updatefitnessDetailsView.fitnessLevelSegmentedControl.selectedSegmentIndex
        let fitnessLevel = updatefitnessDetailsView.fitnessLevelSegmentedControl.titleForSegment(at: fitnessLevelIndex) ?? ""
        
        let userFitnessModel = UserFitnessModel(fitnessGoal: fitnessGoal, fitnessLevel: fitnessLevel, weeklyGoal: selectedDays, updated: DateTimeHelper().getCurrentDateTime)
        
        updateUserDataToFirestore(userFitnessModel: userFitnessModel)
        print(userFitnessModel)
    }
    
    // Update to user document
    private func updateUserDataToFirestore(userFitnessModel: UserFitnessModel) {
        
        let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        progressHUD.label.text = "Saving..."
        
        guard let userID = AuthService.currentUser?.uid else {
            // Handle the case when the user ID is not available
            return
        }
        
        UserFitnessService.shared.updateUserFitnessData(userID: userID, fitnessData: userFitnessModel) { result in
            DispatchQueue.main.async {
                progressHUD.hide(animated: true)
                
                switch result {
                case .success:
                    // Update successful
                    print("User fitness data updated successfully")
                    // Perform any additional actions or show success message
                    
                    // Call storeHealthRecordInFirestore
                    guard let userID = AuthService.currentUser?.uid else {
                        // Handle the case when the user ID is not available
                        return
                    }
                    
                    self.storeFitnessRecordInFirestore(userID: userID, userFitnessModel: userFitnessModel) { success in
                        if success {
                            // Health record stored successfully
                            print("Health record stored in Firestore")
                            AlertDialogWrapper().showErrorAlert(viewController: self, error: "Fitness Data Updated!", message: "User fitness data updated successfully")
                        } else {
                            // Failed to store health record
                            print("Failed to store health record in Firestore")
                            AlertDialogWrapper().showErrorAlert(viewController: self, error: "Fitness Data Cannot Update!", message: "Failed to update user fitness data")
                        }
                    }
                    
                case .failure(let error):
                    // Update failed
                    print("Failed to update user fitness data: \(error)")
                    // Display an error message or handle the error gracefully
                    AlertDialogWrapper().showErrorAlert(viewController: self, error: "Fitness Data Cannot Update!", message: "Failed to update user fitness data")
                }
            }
        }
        
    }
    
    private func storeFitnessRecordInFirestore(userID: String, userFitnessModel: UserFitnessModel, completion: @escaping (Bool) -> Void) {
        
        UserFitnessService.shared.createUserFitnessDocument(userID: userID,  fitnessData: userFitnessModel) { result in
            switch result {
            case .success:
                print("User fitness data stored in Firestore")
                completion(true)
                
            case .failure(let error):
                print("Failed to store user fitness data in Firestore:", error)
                completion(false)
            }
        }
    }
}
