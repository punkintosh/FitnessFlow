//
//  AuthHeader.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit

class AuthHeader: UIView {
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = AppThemeData.colorTextBlack
        label.font = AppThemeData.fontSizeTitle1
        return label
    }()
    
    private let labelCaption: UILabel = {
        let label = UILabel()
        label.textColor = AppThemeData.colorTextPrimary
        label.font = AppThemeData.fontSizeTextButton
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubview(labelTitle)
        addSubview(labelCaption)
        addSubview(imageView)
    }
    
    private func setupConstraints() {
        let stackView = UIStackView(arrangedSubviews: [labelTitle, labelCaption])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        addSubview(imageView)
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
    }

    
    func configure(title: String, caption: String, imageName: String) {
        labelTitle.text = title
        labelCaption.text = caption
        imageView.image = UIImage(named: imageName)
    }
}
