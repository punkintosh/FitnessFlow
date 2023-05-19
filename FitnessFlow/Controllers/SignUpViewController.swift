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
//        title = "Sign Up"
//        navigationController?.navigationBar.prefersLargeTitles = true
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
            
            AuthService.signUp(authModel: authModel) { [weak self] result in
                DispatchQueue.main.async {
                    progressHUD.hide(animated: true)
                    
                    switch result {
                    case .success(let user):
                        // User signed up successfully
                        print("User signed up:", user)
                        self?.showAlert(title: "Success", message: "Sign up successful!") { _ in
                            self?.navigateToHome()
                        }
                    case .failure(let error):
                        // Handle sign up error
                        print("Sign up error:", error)
                        if error.localizedDescription == "The email address is already in use by another account." {
                            self?.showAlert(title: "Error", message: "Sign up failed. The email address is already in use by another account.")
                        }
                        self?.showAlert(title: "Error", message: "Sign up failed. Please try again.")
                    }
                }
            }
        }
    }
    
    //TODO: Add showAlerts to components later
    private func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: completion)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func navigateToHome() {
        let homeViewController = HomeViewController()
        navigationController?.setViewControllers([homeViewController], animated: true)
    }

}
