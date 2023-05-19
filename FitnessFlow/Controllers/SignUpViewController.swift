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
        navigationController?.navigationBar.backgroundColor = AppThemeData.colorSecondaryWhite
        navigationController?.navigationBar.tintColor = AppThemeData.colorTextDarkGray
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorSecondaryWhite
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
        
        let userModel = UserModel(firstName: firstName, lastName: lastName, email: email, password: password)
        let authModel = AuthModel(email: email, password: password)
        
        let formValidator = FormValidator()
        if formValidator.validateSignUp(viewController: self, userModel: userModel, confirmPassword: confirmPassword) {
            print("---------- User Details ----------")
            print("First Name: ", userModel.firstName)
            print("Last Name: ", userModel.lastName)
            print("Email: ", userModel.email)
            print("Password: ", userModel.password)
            print("Confirm Password: ", confirmPassword)
            print("Signing Up....")
            
            let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
            progressHUD.label.text = "Signing up..."
            
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
            "password": userModel.password
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

