//
//  AssistantViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit
import MBProgressHUD
import FirebaseFirestore

class AssistantViewController: UIViewController {
    private let assistantView: AssistantView
    private var userScheduleCollectionListener: ListenerRegistration?
    private var userModel: UserModel?
    private let currentUserID = AuthService.currentUser?.uid
    private var userDocumentListener: ListenerRegistration?

    init() {
        self.assistantView = AssistantView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startListeningForUserDataChanges()
    }
    
    private func startListeningForUserDataChanges() {
        userDocumentListener = UserService.shared.fetchUserDocument(userID: currentUserID!) { [weak self] result in
            switch result {
            case .success(let userData):
                guard let firstName = userData["firstName"] as? String,
                      let lastName = userData["lastName"] as? String,
                      let email = userData["email"] as? String,
                      let password = userData["password"] as? String,
                      let height = userData["height"] as? Double,
                      let weight = userData["weight"] as? Double,
                      let age = userData["age"] as? Int,
                      let gender = userData["gender"] as? String,
                      let healthConditions = userData["healthConditions"] as? Array<String>,
                      let fitnessGoal = userData["fitnessGoal"] as? String,
                      let fitnessLevel = userData["fitnessLevel"] as? String,
                      let created = userData["created"] as? String,
                      let updated = userData["updated"] as? String,
                      let weeklyGoal = userData["weeklyGoal"] as? Array<String> else {
                    // Handle missing data or incorrect types
                    print("Invalid user data")
                    return
                }
                let userModel = UserModel(firstName: firstName, lastName: lastName, email: email, password: password, height: height, weight: weight, age: age, gender: gender, healthConditions: healthConditions, fitnessGoal: fitnessGoal, fitnessLevel: fitnessLevel, weeklyGoal: weeklyGoal, created: created, updated: updated)
                self?.userModel = userModel
                // self?.assistantView.configure(userModel: userModel)
            case .failure(let error):
                print("Failed to fetch user data: \(error)")
            }
        }
    }
    
    private func stopListeningForUserDataChanges() {
        userDocumentListener?.remove()
        userDocumentListener = nil
    }

    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(assistantView)
        assistantView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        assistantView.getScheduleButton.addTarget(self, action: #selector(getScheduleButtonTapped), for: .touchUpInside)
    }

    @objc private func getScheduleButtonTapped() {
        print("getScheduleButtonTapped!")
        
        let nextViewController = RecommendationsViewController(userModel: userModel!)
        self.navigationController?.pushViewController(nextViewController, animated: true)

    }
}

