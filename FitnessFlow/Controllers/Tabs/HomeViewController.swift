//
//  HomeViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let homeView: HomeView
    private let userModel: UserModel

    let userDatafromFirestore = UserModel(firstName: "Dileepa", lastName: "Bandara", email: "contact@dileepbandara.dev", password: "", height: 178, weight: 78, age: 24, gender: "Male", healthConditions: [""], fitnessGoal: "Keep Fit", fitnessLevel: "Beginner", weeklyGoal: "7")

    init() {
        self.userModel = userDatafromFirestore
        self.homeView = HomeView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        homeView.configure(userModel: userModel)
    }

    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
