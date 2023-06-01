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
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "All Fields Required", message: "Please fill in all the required fields.")
            return false
        }
        
        if email.isEmpty {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "Email Required", message: "Please fill in your email.")
            return false
        }
        
        if !validateEmail(email: email) {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "Invalid Email", message: "Please enter a valid email address.")
            return false
        }
        
        if password.isEmpty {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "Password Required", message: "Please fill in your password")
            return false
        }
        
        return true
    }
    
    func validateSignUp(viewController: UIViewController, userAccountModel: UserAccountModel, confirmPassword:String) -> Bool {
        
        if userAccountModel.firstName.isEmpty && userAccountModel.lastName.isEmpty && userAccountModel.email.isEmpty && userAccountModel.password.isEmpty && confirmPassword.isEmpty {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "All Fields Required", message: "Please fill in all the required fields.")
            return false
        }
        
        if userAccountModel.firstName.isEmpty {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "First Name Required", message: "Please fill in your first name.")
            return false
        }
        
        if userAccountModel.lastName.isEmpty {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "Last Name Required", message: "Please fill in your last name.")
            return false
        }
        
        if userAccountModel.email.isEmpty {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "Email Required", message: "Please fill in your email.")
            return false
        }
        
        if !validateEmail(email: userAccountModel.email) {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "Invalid Email", message: "Please enter a valid email address.")
            return false
        }
        
        if userAccountModel.password.isEmpty {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "Password Required", message: "Please fill in your password.")
            return false
        }
        
        if userAccountModel.password.count < 8 {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "Invalid Password", message: "Password should be at least \(8) characters long.")
            return false
        }
        
        if confirmPassword.isEmpty {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "Confirm Password Required", message: "Please fill in your confirm password")
            return false
        }
        
        if userAccountModel.password != confirmPassword {
            AlertDialogWrapper().showErrorAlert(viewController: viewController, error: "Passwords Do Not Match", message: "Password and Confirm Password do not match.")
            return false
        }
        
        return true
    }
}

