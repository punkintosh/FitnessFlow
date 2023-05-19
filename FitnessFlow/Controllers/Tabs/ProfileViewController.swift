//
//  ProfileViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit
import FirebaseFirestore

class ProfileViewController: UIViewController {
    private let profileView: ProfileView
    private let currentUserID = AuthService.currentUser?.uid
    // Section 1
    private var userModel: UserModel?
    private var userDocumentListener: ListenerRegistration?
    
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
        // Section 1
        fetchUserData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Section 1
        startListeningForUserDataChanges()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Section 1
        stopListeningForUserDataChanges()
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        // Section 1
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editAccountDetails))
        profileView.editButtonAccount.addGestureRecognizer(tapGesture)
        // Section 2
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(editHealthDetails))
        profileView.editButtonHealth.addGestureRecognizer(tapGesture2)
    }
    
    // Section 1
    @objc private func editAccountDetails() {
        print("editAccountDetails...")
    }
    
    // Section 2
    @objc private func editHealthDetails() {
        let nextViewController = AddHealthDetailsViewController()
        navigationController?.pushViewController(nextViewController, animated: false)
    }
    
    // Section 1
    private func fetchUserData() {
        profileView.configure(with: nil) // Display "Loading..." text initially
        FirestoreService.shared.fetchUserDocument(userID: currentUserID!) { result in
            switch result {
            case .success(let userData):
                self.userModel = UserModel(firstName: userData["firstName"] as? String ?? "",
                                           lastName: userData["lastName"] as? String ?? "",
                                           email: userData["email"] as? String ?? "",
                                           password: "")
                self.profileView.configure(with: self.userModel)
            case .failure(let error):
                print("Failed to fetch user data: \(error)")
                // Handle the error and update the UI accordingly
            }
        }
    }

    // Section 1
    private func startListeningForUserDataChanges() {
        userDocumentListener = FirestoreService.shared.addUserDocumentListener(userID: currentUserID!) { [weak self] result in
            switch result {
            case .success(let userData):
                self?.userModel = UserModel(firstName: userData["firstName"] as? String ?? "",
                                            lastName: userData["lastName"] as? String ?? "",
                                            email: userData["email"] as? String ?? "",
                                            password: "")
                self?.profileView.configure(with: self?.userModel)
            case .failure(let error):
                print("Failed to fetch user data: \(error)")
            }
        }
    }
    
    // Section 1
    private func stopListeningForUserDataChanges() {
        userDocumentListener?.remove()
        userDocumentListener = nil
    }
}
