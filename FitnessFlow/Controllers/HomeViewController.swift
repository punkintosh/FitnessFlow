//
//  HomeViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let authModel = AuthModel(email: AuthService.currentUser?.email ?? "", password: "")
    private let homeView: HomeView
    
    init() {
        self.homeView = HomeView(authModel: authModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorSecondaryWhite
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        homeView.signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
    }
    
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
