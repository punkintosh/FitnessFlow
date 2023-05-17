//
//  SignUpViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    private let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(signUpView)
        
        signUpView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    
    private func setupBindings() {
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(switchToLogin))
        signUpView.switchLoginButton.addGestureRecognizer(tapGesture)
    }
    
    @objc private func signUpButtonTapped() {
        let firstName = signUpView.firstNameTextField.text ?? ""
        let lastName = signUpView.lastNameTextField.text ?? ""
        let email = signUpView.emailTextField.text ?? ""
        let password = signUpView.passwordTextField.text ?? ""
        let confirmPassword = signUpView.confirmPasswordTextField.text ?? ""
        
        if validateInputs() {
            print("First Name: ", firstName)
            print("Last Name: ", lastName)
            print("Email: ", email)
            print("Password: ", password)
            print("Confirm Password: ", confirmPassword)
        }
    }
    
    @objc func switchToLogin() {
        print("Switch to Login")
    }
    
    private func validateInputs() -> Bool {
        let firstName = signUpView.firstNameTextField.text ?? ""
        let lastName = signUpView.lastNameTextField.text ?? ""
        let email = signUpView.emailTextField.text ?? ""
        let password = signUpView.passwordTextField.text ?? ""
        let confirmPassword = signUpView.confirmPasswordTextField.text ?? ""
        
        // Validate and process the sign-up data
        if firstName.isEmpty && lastName.isEmpty && email.isEmpty && password.isEmpty && confirmPassword.isEmpty {
            showErrorAlert(error: "All Fields Required", message: "Please fill in all the required fields.")
            return false
        }
        
        if firstName.isEmpty {
            showErrorAlert(error: "First Name Required", message: "Please fill in your first name.")
            return false
        }
        
        if lastName.isEmpty {
            showErrorAlert(error: "Last Name Required", message: "Please fill in your last name.")
            return false
        }
        
        if email.isEmpty {
            showErrorAlert(error: "Email Required", message: "Please fill in your email.")
            return false
        }
        
        if password.isEmpty {
            showErrorAlert(error: "Password Required", message: "Please fill in your password")
            return false
        }
        
        if confirmPassword.isEmpty {
            showErrorAlert(error: "Confirm Password Required", message: "Please fill in your confirm password")
            return false
        }
        
        if password != confirmPassword {
            showErrorAlert(error: "Passwords Do Not Match", message: "Password and Confirm Password do not match.")
            return false
        }
        
        return true
    }
    
    private func showErrorAlert(error: String, message: String) {
        let alertController = UIAlertController(title: error, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
