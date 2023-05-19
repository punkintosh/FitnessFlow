//
//  CTabHeader.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class CTabHeader: UIView {
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
    }
    
    private func setupConstraints() {
        let stackView = UIStackView(arrangedSubviews: [labelTitle, labelCaption])
        stackView.axis = .vertical
        stackView.spacing = 5
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    func configure(title: String, caption: String) {
        labelTitle.text = title
        labelCaption.text = caption
    }
}
