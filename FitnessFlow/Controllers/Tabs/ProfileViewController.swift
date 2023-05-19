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
    private var userModel: UserModel?
    private let currentUserID = AuthService.currentUser?.uid
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
        fetchUserData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startListeningForUserDataChanges()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editAccountDetails))
        profileView.editButtonAccount.addGestureRecognizer(tapGesture)
    }
    
    @objc private func editAccountDetails() {
        print("editAccountDetails...")
    }
    
    private func fetchUserData() {
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
            }
        }
    }
    
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
    
    private func stopListeningForUserDataChanges() {
        userDocumentListener?.remove()
        userDocumentListener = nil
    }
}
