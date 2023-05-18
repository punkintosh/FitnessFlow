//
//  FormValidator.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit

class FormValidator {
    
    func validateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func validateLogIn(viewController: UIViewController, email: String, password: String) -> Bool {
        
        if email.isEmpty && password.isEmpty {
            showErrorAlert(viewController: viewController, error: "All Fields Required", message: "Please fill in all the required fields.")
            return false
        }
        
        if email.isEmpty {
            showErrorAlert(viewController: viewController, error: "Email Required", message: "Please fill in your email.")
            return false
        }
        
        if !validateEmail(email: email) {
            showErrorAlert(viewController: viewController, error: "Invalid Email", message: "Please enter a valid email address.")
            return false
        }
        
        if password.isEmpty {
            showErrorAlert(viewController: viewController, error: "Password Required", message: "Please fill in your password")
            return false
        }
        
        return true
    }
    
    func validateSignUp(viewController: UIViewController, userModel: UserModel, confirmPassword:String) -> Bool {
        
        if userModel.firstName.isEmpty && userModel.lastName.isEmpty && userModel.email.isEmpty && userModel.password.isEmpty && confirmPassword.isEmpty {
            showErrorAlert(viewController: viewController, error: "All Fields Required", message: "Please fill in all the required fields.")
            return false
        }
        
        if userModel.firstName.isEmpty {
            showErrorAlert(viewController: viewController, error: "First Name Required", message: "Please fill in your first name.")
            return false
        }
        
        if userModel.lastName.isEmpty {
            showErrorAlert(viewController: viewController, error: "Last Name Required", message: "Please fill in your last name.")
            return false
        }
        
        if userModel.email.isEmpty {
            showErrorAlert(viewController: viewController, error: "Email Required", message: "Please fill in your email.")
            return false
        }
        
        if !validateEmail(email: userModel.email) {
            showErrorAlert(viewController: viewController, error: "Invalid Email", message: "Please enter a valid email address.")
            return false
        }
        
        if userModel.password.isEmpty {
            showErrorAlert(viewController: viewController, error: "Password Required", message: "Please fill in your password.")
            return false
        }
        
        if userModel.password.count < 8 {
            showErrorAlert(viewController: viewController, error: "Invalid Password", message: "Password should be at least \(8) characters long.")
            return false
        }
        
        if confirmPassword.isEmpty {
            showErrorAlert(viewController: viewController, error: "Confirm Password Required", message: "Please fill in your confirm password")
            return false
        }
        
        if userModel.password != confirmPassword {
            showErrorAlert(viewController: viewController, error: "Passwords Do Not Match", message: "Password and Confirm Password do not match.")
            return false
        }
        
        return true
    }
    
    private func showErrorAlert(viewController: UIViewController, error: String, message: String) {
        let alertController = UIAlertController(title: error, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}

