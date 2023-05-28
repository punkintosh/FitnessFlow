//
//  CreateAccountViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import UIKit
import SnapKit
import MBProgressHUD

class CreateAccountViewController: UIViewController {
    private let createAccountView: CreateAccountView
    
    private let userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
        self.createAccountView = CreateAccountView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        createAccountView.configure(userModel: userModel)
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(createAccountView)
        createAccountView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        createAccountView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc private func signUpButtonTapped() {
        print("Signing Up....")
        
        let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        progressHUD.label.text = "Signing up..."
        
        let authModel = AuthModel(email: userModel.email, password: userModel.password)
        
        signUpUser(authModel: authModel, userModel: userModel) { [weak self] success in
            progressHUD.hide(animated: true)
            
            if success {
                print("User signed up and data stored in Firestore")
                let homeViewController = MainTabBarController()
                self?.navigationController?.setViewControllers([homeViewController], animated: true)
            } else {
                print("Sign up failed or failed to store user data in Firestore")
                // Show appropriate error message or handle the error
            }
        }
    }
    
    private func signUpUser(authModel: AuthModel, userModel: UserModel, completion: @escaping (Bool) -> Void) {
        AuthService.signUp(authModel: authModel) { [weak self] result in
            switch result {
            case .success(let user):
                // User signed up successfully
                print("User signed up:", user)
                self?.storeUserDataInFirestore(userID: user.uid, userModel: userModel, completion: completion)
                
            case .failure(let error):
                // Handle sign up error
                print("Sign up error:", error)
                completion(false)
            }
        }
    }
    
    private func storeUserDataInFirestore(userID: String, userModel: UserModel, completion: @escaping (Bool) -> Void) {
        let userData = [
            "firstName": userModel.firstName,
            "lastName": userModel.lastName,
            "email": userModel.email,
            "password": userModel.password,
            
            "height": userModel.height,
            "weight": userModel.weight,
            "age": userModel.age,
            "gender": userModel.gender,
            "healthConditions": userModel.healthConditions,
            
            "fitnessGoal": userModel.fitnessGoal,
            "fitnessLevel": userModel.fitnessLevel,
            "weeklyGoal": userModel.weeklyGoal,
            "created": userModel.created,
            "updated": userModel.updated
        ] as [String : Any]
        
        UserService.shared.createUserDocument(userID: userID, data: userData) { result in
            switch result {
            case .success:
                print("User data stored in Firestore")
                self.storeHealthRecordInFirestore(userID: userID, userModel: userModel, completion: completion)
                self.storeFitnessRecordInFirestore(userID: userID, userModel: userModel, completion: completion)
                completion(true)
                
            case .failure(let error):
                print("Failed to store user data in Firestore:", error)
                completion(false)
            }
        }
    }
    
    private func storeHealthRecordInFirestore(userID: String, userModel: UserModel, completion: @escaping (Bool) -> Void) {
        
        let userHealthModel = UserHealthModel(height: userModel.height, weight: userModel.weight, age: userModel.age, gender: userModel.gender, healthConditions: userModel.healthConditions, updated: userModel.updated)
        
        UserHealthService.shared.createUserHealthDocument(userID: userID,  healthData: userHealthModel) { result in
            switch result {
            case .success:
                print("User health data stored in Firestore")
                completion(true)
                
            case .failure(let error):
                print("Failed to store user health data in Firestore:", error)
                completion(false)
            }
        }
    }
    
    private func storeFitnessRecordInFirestore(userID: String, userModel: UserModel, completion: @escaping (Bool) -> Void) {
        
        let userFitnessModel = UserFitnessModel(fitnessGoal: userModel.fitnessGoal, fitnessLevel: userModel.fitnessLevel, weeklyGoal: userModel.weeklyGoal, updated: userModel.updated)
        
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

