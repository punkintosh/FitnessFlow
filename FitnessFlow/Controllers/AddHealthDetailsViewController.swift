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
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(addHealthDetailsView)
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = AppThemeData.colorTextDarkGray
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: AppThemeData.fontSizeTextButton as Any
        ]
        backButton.setTitleTextAttributes(attributes, for: .normal)
        
        addHealthDetailsView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }


}
