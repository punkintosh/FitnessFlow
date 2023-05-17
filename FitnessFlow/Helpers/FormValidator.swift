//
//  FormValidator.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit

class FormValidator {
    func validateSignUp(viewController: UIViewController, firstName: String, lastName: String, email: String, password: String, confirmPassword: String) -> Bool {
        // Validate and process the sign-up data
        if firstName.isEmpty && lastName.isEmpty && email.isEmpty && password.isEmpty && confirmPassword.isEmpty {
            showErrorAlert(viewController: viewController, error: "All Fields Required", message: "Please fill in all the required fields.")
            return false
        }
        
        if firstName.isEmpty {
            showErrorAlert(viewController: viewController, error: "First Name Required", message: "Please fill in your first name.")
            return false
        }
        
        if lastName.isEmpty {
            showErrorAlert(viewController: viewController, error: "Last Name Required", message: "Please fill in your last name.")
            return false
        }
        
        if email.isEmpty {
            showErrorAlert(viewController: viewController, error: "Email Required", message: "Please fill in your email.")
            return false
        }
        
        if password.isEmpty {
            showErrorAlert(viewController: viewController, error: "Password Required", message: "Please fill in your password")
            return false
        }
        
        if confirmPassword.isEmpty {
            showErrorAlert(viewController: viewController, error: "Confirm Password Required", message: "Please fill in your confirm password")
            return false
        }
        
        if password != confirmPassword {
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

