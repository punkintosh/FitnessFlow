//
//  HomeViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let homeModel = HomeModel(appName: AppThemeData.appName, appDescription: AppThemeData.appDescription)
    private let homeView: HomeView
    
    init() {
        self.homeView = HomeView(homeModel: homeModel)
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
        homeView.continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    @objc private func continueButtonTapped() {
        print("App name: ", homeModel.appName)
        print("App description: ", homeModel.appDescription)
        
        let alertController = UIAlertController(title: "Alert", message: "Continue button tapped!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
