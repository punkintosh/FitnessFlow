//
//  WorkoutsView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class WorkoutsView: UIView {
    
    let tabHeader = CTabHeader()

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
        addSubview(tabHeader)
        
        tabHeader.configure(title: "Workouts", caption: "Discover new routines")
        
        tabHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
    }

    private func configure() {
        title.text = "Workouts"
    }
}
