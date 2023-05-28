//
//  AssistantView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class AssistantView: UIView {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    let contentView: UIView = {
        let view = UIView()
        return view
    }()

    let tabHeaderTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    let tabHeaderCaption: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let currentProgressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let getScheduleButton = ButtonWrapper.primaryButton(title: "Get Recommendations")

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configure()
    }

    func configure() {
        tabHeaderTitle.text = "Assistant"
        tabHeaderCaption.text = "Guidelines provider"
        currentProgressLabel.text = "Get Recommendations"
    }

    private func setupUI() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tabHeaderTitle)
        contentView.addSubview(tabHeaderCaption)
        contentView.addSubview(currentProgressLabel)
        contentView.addSubview(getScheduleButton)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(getScheduleButton.snp.bottom).offset(16)
        }
        
        tabHeaderTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        tabHeaderCaption.snp.makeConstraints { make in
            make.top.equalTo(tabHeaderTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        currentProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(tabHeaderCaption.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        getScheduleButton.snp.makeConstraints { make in
            make.top.equalTo(currentProgressLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}

