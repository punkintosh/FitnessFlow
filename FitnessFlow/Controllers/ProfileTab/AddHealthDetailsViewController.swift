//
//  AddHealthDetailsViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class AddHealthDetailsViewController: UIViewController {
    private let addHealthDetailsView: AddHealthDetailsView
    
    init() {
        self.addHealthDetailsView = AddHealthDetailsView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        customizeNavigationBar()
        customizeNavigationBarBackButton()
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(addHealthDetailsView)
        
        // Title
        title = "Add Health Details"
        
        addHealthDetailsView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func customizeNavigationBar() {
        let customFont = AppThemeData.fontSizeHeadline ?? UIFont.systemFont(ofSize: 20)
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: customFont,
            NSAttributedString.Key.foregroundColor: AppThemeData.colorTextDarkGray
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    private func customizeNavigationBarBackButton() {
        // Back Button
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = AppThemeData.colorTextDarkGray
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: AppThemeData.fontSizeTextButton!,
            NSAttributedString.Key.foregroundColor: AppThemeData.colorTextDarkGray
        ]
        backButton.setTitleTextAttributes(attributes, for: .normal)
    }

    
}
