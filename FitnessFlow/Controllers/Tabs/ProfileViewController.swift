//
//  ProfileViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit

class ProfileViewController: UIViewController {
    private let profileView: ProfileView
    // Account
    private let profileService = ProfileAccountService.shared
    
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
        // Account
        profileService.fetchUserData() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let userModel):
                    self?.profileView.configure(with: userModel)
                case .failure(let error):
                    print("Failed to fetch user data: \(error)")
                    // Handle the error and update the UI accordingly
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Account
        profileService.startListeningForUserDataChanges() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let userModel):
                    self?.profileView.configure(with: userModel)
                case .failure(let error):
                    print("Failed to listen for user data changes: \(error)")
                    // Handle the error and update the UI accordingly
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Account
        profileService.stopListeningForUserDataChanges()
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        // Account
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editAccountDetails))
        profileView.editButtonAccount.addGestureRecognizer(tapGesture)
        // Health
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(editHealthDetails))
        profileView.editButtonHealth.addGestureRecognizer(tapGesture2)
    }
    
    // Account
    @objc private func editAccountDetails() {
        print("editAccountDetails...")
    }
    
    // Health
    @objc private func editHealthDetails() {
        let nextViewController = AddHealthDetailsViewController()
        navigationController?.pushViewController(nextViewController, animated: false)
    }
}
