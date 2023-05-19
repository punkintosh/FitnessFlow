//
//  ProfileView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class ProfileView: UIView {

    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = AppThemeData.fontSizeTitle1
        return label
    }()

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
        addSubview(title)
        addSubview(email)

        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        email.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }

    private func configure(with authModel: AuthModel) {
        title.text = "ProfileView"
        email.text = authModel.email
    }
}

