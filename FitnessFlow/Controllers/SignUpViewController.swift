//
//  SignUpViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit
import MBProgressHUD

class SignUpViewController: UIViewController {
    private let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        navigationController?.navigationBar.backgroundColor = AppThemeData.colorBackgroundLight
        navigationController?.navigationBar.tintColor = AppThemeData.colorTextDarkGray
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(signUpView)
        
        signUpView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupBindings() {
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc private func signUpButtonTapped() {
        let firstName = signUpView.firstNameTextField.text ?? ""
        let lastName = signUpView.lastNameTextField.text ?? ""
        let email = signUpView.emailTextField.text ?? ""
        let password = signUpView.passwordTextField.text ?? ""
        let confirmPassword = signUpView.confirmPasswordTextField.text ?? ""
        
        let userAccountModel = UserAccountModel(firstName: firstName, lastName: lastName, email: email, password: password)
        let authModel = AuthModel(email: email, password: password)
        
        let formValidator = FormValidator()
        if formValidator.validateSignUp(viewController: self, userAccountModel: userAccountModel, confirmPassword: confirmPassword) {
            print("---------- User Details ----------")
            print("First Name: ", userAccountModel.firstName)
            print("Last Name: ", userAccountModel.lastName)
            print("Email: ", userAccountModel.email)
            print("Password: ", userAccountModel.password)
            print("Confirm Password: ", confirmPassword)
            print("Signing Up....")
            
            let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
            progressHUD.label.text = "Signing up..."
            
            signUpUser(authModel: authModel, userAccountModel: userAccountModel) { [weak self] success in
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
    }
    
    private func signUpUser(authModel: AuthModel, userAccountModel: UserAccountModel, completion: @escaping (Bool) -> Void) {
        AuthService.signUp(authModel: authModel) { [weak self] result in
            switch result {
            case .success(let user):
                // User signed up successfully
                print("User signed up:", user)
                self?.storeUserDataInFirestore(userID: user.uid, userAccountModel: userAccountModel, completion: completion)
                
            case .failure(let error):
                // Handle sign up error
                print("Sign up error:", error)
                completion(false)
            }
        }
    }
    
    private func storeUserDataInFirestore(userID: String, userAccountModel: UserAccountModel, completion: @escaping (Bool) -> Void) {
        let userData = [
            "firstName": userAccountModel.firstName,
            "lastName": userAccountModel.lastName,
            "email": userAccountModel.email,
            "password": userAccountModel.password
        ]
        
        FirestoreService.shared.createUserDocument(userID: userID, data: userData) { result in
            switch result {
            case .success:
                print("User data stored in Firestore")
                completion(true)
                
            case .failure(let error):
                print("Failed to store user data in Firestore:", error)
                completion(false)
            }
        }
    }
}

