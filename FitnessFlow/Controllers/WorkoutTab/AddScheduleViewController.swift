//
//  AddScheduleViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-28.
//

import UIKit
import SnapKit
import MBProgressHUD
import FirebaseFirestore

class AddScheduleViewController: UIViewController {
    private let addScheduleView: AddScheduleView
    private let workoutLevelExcersiseModel: WorkoutLevelExcersiseModel
    private let level: String
    private let muscleGroup: String
    
    init(workoutLevelExcersiseModel: WorkoutLevelExcersiseModel, level: String, muscleGroup: String) {
        self.addScheduleView = AddScheduleView()
        self.workoutLevelExcersiseModel = workoutLevelExcersiseModel
        self.level = level
        self.muscleGroup = muscleGroup
        self.addScheduleView.configure(workoutLevelExcersiseModel: workoutLevelExcersiseModel, level: level, muscleGroup: muscleGroup)
        super.init(nibName: nil, bundle: nil)
        print("level: " + level)
        print("muscleGroup: " + muscleGroup)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        customizeNavigationBarBackButton()
        print("----- AboutWorkoutViewController -----")
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        title = "Create Schedule"
        view.addSubview(addScheduleView)
        addScheduleView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addScheduleView.createScheduleButton.addTarget(self, action: #selector(createScheduleButtonTapped), for: .touchUpInside)
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
    
    @objc private func createScheduleButtonTapped() {
        print("createScheduleButtonTapped!")
        
        let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        progressHUD.label.text = "Saving..."
        
        let formattedDate = DateTimeHelper().convertDateTimePicker(addScheduleView.datePicker.date)
        
        let userScheduleModel = UserScheduleModel(muscleGroup: self.muscleGroup, level: self.level, exercise: self.workoutLevelExcersiseModel.name, reps: self.workoutLevelExcersiseModel.reps, date: formattedDate)
        
        print("----- AddScheduleViewController -----")
        print("Muscle Group: \(userScheduleModel.muscleGroup)")
        print("Level: \(userScheduleModel.level)")
        print("Exercise Name: \(userScheduleModel.exercise)")
        print("Exercise Reps: \(userScheduleModel.reps)")
        print("Date: \(userScheduleModel.date)")
        
        guard let userID = AuthService.currentUser?.uid else {
            // Handle the case when the user ID is not available
            return
        }
        
        UserScheduleService.shared.createUserSchedule(userID: userID, userScheduleModel: userScheduleModel) { result in
            DispatchQueue.main.async {
                progressHUD.hide(animated: true)
                
                switch result {
                case .success:
                    // Update successful
                    print("User schedule save successfully")
                    // Perform any additional actions or show success message
                    AlertDialogWrapper().showErrorAlert(viewController: self, error: "Schedule Saved", message: "Your exercise has sucessfully added to the schedule!")
                    
                case .failure(let error):
                    // Update failed
                    print("Failed to save user schedule data: \(error)")
                    // Display an error message or handle the error gracefully
                    AlertDialogWrapper().showErrorAlert(viewController: self, error: "Schedule Cannot Save", message: "Your exercise cannot add to the schedule. Try again later!")
                }
            }
        }
    }
}

