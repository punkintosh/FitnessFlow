//
//  LogInViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-18.
//

import UIKit
import SnapKit
import MBProgressHUD

class LogInViewController: UIViewController {
    private let logInView = LogInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
//        title = "Log In"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.backgroundColor = AppThemeData.colorSecondaryWhite
//
//
//        let navBarTitleFont = AppThemeData.fontSizeLargeTitle ?? UIFont.systemFont(ofSize: 16, weight: .semibold)
//        let navBarTitleColor = AppThemeData.colorTextBlack
//
//        let attributes: [NSAttributedString.Key: Any] = [
//            .foregroundColor: navBarTitleColor,
//            .font: navBarTitleFont
//        ]
//        navigationController?.navigationBar.largeTitleTextAttributes = attributes
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorSecondaryWhite
        view.addSubview(logInView)
        
        logInView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setupBindings() {
        logInView.logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(switchToSignUp))
        logInView.switchLoginButton.addGestureRecognizer(tapGesture)
    }
    
    @objc private func logInButtonTapped() {
        let email = logInView.emailTextField.text ?? ""
        let password = logInView.passwordTextField.text ?? ""
        
        let authModel = AuthModel(email: email, password: password)
        
        let formValidator = FormValidator()
        if formValidator.validateLogIn(viewController: self, email: email, password: password) {
            print("---------- User Details ----------")
            print("Email: ", email)
            print("Password: ", password)
            print("Login....")
            
            let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
            progressHUD.label.text = "Loging..."
            
            AuthService.signIn(authModel: authModel) { [weak self] result in
                DispatchQueue.main.async {
                    progressHUD.hide(animated: true)
                    
                    switch result {
                    case .success(let user):
                        // User signed in successfully
                        print("User signed in:", user)
                        self?.navigateToHome()
//                        self?.showAlert(title: "Success", message: "Sign in successful!") { _ in
//                            self?.navigateToHome()
//                        }
                    case .failure(let error):
                        // Handle sign in error
                        print("Sign in error:", error)
                        if error.localizedDescription == "The password is invalid or the user does not have a password." {
                            self?.showAlert(title: "Error", message: "Login failed. The password is invalid or the user does not have a password.")
                        }
                        self?.showAlert(title: "Error", message: "Login failed. Please try again.")
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
    
    @objc private func switchToSignUp() {
        let nextViewController = SignUpViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
