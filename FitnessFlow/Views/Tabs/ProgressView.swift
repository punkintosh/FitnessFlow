//
//  ProgressView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class ProgressView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let tabHeaderTitle = CLabel.iOSPageTitleUnscrolled()
    let tabHeaderCaption = CLabel.iOSSubhead()
    
    // MARK: Current Progress
    let currentProgressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
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
    func configure() {
        tabHeaderTitle.text = "Progress"
        tabHeaderCaption.text = "Visualize achievements"
        
        // Recommended
        currentProgressLabel.text = "Current Progress"
    }

    private func setupUI() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tabHeaderTitle)
        contentView.addSubview(tabHeaderCaption)
        contentView.addSubview(currentProgressLabel)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(currentProgressLabel.snp.bottom).offset(16)
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
            make.top.equalTo(tabHeaderCaption.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

