//
//  HomeView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = AppThemeData.fontSizeTitle1
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configure()
    }
    
    private func setupUI() {
        addSubview(title)
        
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    private func configure() {
        title.text = "Home"
    }
}
