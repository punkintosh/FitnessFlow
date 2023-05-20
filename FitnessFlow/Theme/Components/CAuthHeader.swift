//
//  CAuthHeader.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-18.
//

import UIKit
import SnapKit

class CAuthHeader: UIView {
    private let labelTitle = CLabel.iOSPageTitleUnscrolled()
    
    private let labelCaption = CLabel.iOSPageTitleScrolledPrimaryColor()
    
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
        stackView.spacing = 5
        
        addSubview(stackView)
        addSubview(imageView)
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
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
    
    func setAppBarTitle(_ title: String) {
        labelTitle.text = title
    }
}
