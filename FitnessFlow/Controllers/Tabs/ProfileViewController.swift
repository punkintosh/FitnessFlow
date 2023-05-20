//
//  ProfileViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit

class ProfileViewController: UIViewController {
    private let profileView: ProfileView
    
    init() {
        self.profileView = ProfileView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        profileView.configure()
    }

    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        profileView.signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
    }
    
    private func setupBindings() {
        // Account
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editAccountDetails))
        profileView.editButtonAccount.addGestureRecognizer(tapGesture)
        // Health
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(editHealthDetails))
        profileView.editButtonHealth.addGestureRecognizer(tapGesture2)
        // Fitness
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(editFitnessDetails))
        profileView.editButtonFitness.addGestureRecognizer(tapGesture3)
    }
    
    // Account
    @objc private func editAccountDetails() {
        print("editAccountDetails...")
    }
    
    // Health
    @objc private func editHealthDetails() {
        let nextViewController = AddHealthDetailsViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // Fitness
    @objc private func editFitnessDetails() {
        let nextViewController = AddFitnessDetailsViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // SignOut
    @objc private func signOutButtonTapped() {
        AuthService.signOut {result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.navigationController?.setViewControllers([LogInViewController()], animated: true)
                    print("User sign out!")
                }
            case .failure(let error):
                print("Error signing out: \(error.localizedDescription)")
            }
        }
    }
}
