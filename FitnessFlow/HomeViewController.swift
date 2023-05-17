//
//  HomeViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = AppInfo.appName
        label.textAlignment = .center
        label.textColor = AppInfo.colorFontBlack
        label.font = AppInfo.fontSizeHeader
        return label
    }()
    
    private let sloganLabel: UILabel = {
        let label = UILabel()
        label.text = AppInfo.appDescription
        label.textAlignment = .center
        label.textColor = AppInfo.colorFontLightGray
        label.font = AppInfo.fontSizeSubHeader
        label.numberOfLines = 0
        return label
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(AppInfo.colorFontWhite, for: .normal)
        button.backgroundColor = AppInfo.colorPrimary
        button.titleLabel?.font = AppInfo.buttonFontSize
        button.layer.cornerRadius = AppInfo.buttonCornerRadius
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = AppInfo.colorSecondaryWhite
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(helloLabel)
        view.addSubview(sloganLabel)
        view.addSubview(continueButton)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        helloLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeArea.snp.centerX)
            make.centerY.equalTo(safeArea.snp.centerY)
        }
        
        sloganLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(8)
            make.centerX.equalTo(safeArea.snp.centerX)
        }
        
        continueButton.snp.makeConstraints { make in
            make.centerX.equalTo(safeArea.snp.centerX)
            make.top.equalTo(sloganLabel.snp.bottom).offset(16)
            make.width.equalTo(200)
            make.height.equalTo(48)
        }
    }


}


