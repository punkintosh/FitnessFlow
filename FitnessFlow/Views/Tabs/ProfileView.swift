//
//  ProfileView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    let tabHeader = CTabHeader()

    let email: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = AppThemeData.fontSizeBody
        return label
    }()
    
    init(authModel: AuthModel) {
        super.init(frame: .zero)
        setupUI()
        configure(with: authModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(tabHeader)
        addSubview(email)

        tabHeader.configure(title: "Profile", caption: "Manage your heath data")
        
        tabHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        email.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    private func configure(with authModel: AuthModel) {
        email.text = authModel.email
    }
}

