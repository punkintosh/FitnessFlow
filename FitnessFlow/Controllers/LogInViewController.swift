//
//  LogInViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-18.
//

import UIKit
import SnapKit

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
        
        let formValidator = FormValidator()
        if formValidator.validateLogIn(viewController: self, email: email, password: password) {
            print("Email: ", email)
            print("Password: ", password)
        }
    }
    
    @objc private func switchToSignUp() {
        let nextViewController = SignUpViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
