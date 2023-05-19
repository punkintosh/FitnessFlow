//
//  HomeViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let userModel = UserModel(firstName: "Fn", lastName: "Ln", email: AuthService.currentUser?.email ?? "we", password: "wewe")
    private let homeView: HomeView
    
    init() {
        self.homeView = HomeView(userModel: userModel)
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
                    // Get the current scene
                    guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let delegate = scene.delegate as? SceneDelegate else {
                        return
                    }
                    
                    // Create a new UIWindow and set the rootViewController to LoginViewController
                    let window = UIWindow(windowScene: scene)
                    let loginViewController = LogInViewController()
                    window.rootViewController = UINavigationController(rootViewController: loginViewController)
                    
                    // Set the window and make it visible
                    delegate.window = window
                    window.alpha = 0.0
                    window.makeKeyAndVisible()
                    
                    UIView.animate(withDuration: 0.3) {
                                        window.alpha = 1.0
                                    }
                }
            case .failure(let error):
                print("Error signing out: \(error.localizedDescription)")
            }
        }
    }

}
