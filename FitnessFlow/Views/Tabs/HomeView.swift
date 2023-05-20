//
//  HomeView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let longTextLabel = SampleCodes().longText
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configure()
    }
    
    private func configure() {
        title.text = "Welcome"
    }
    
    private func setupUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(title)
        contentView.addSubview(longTextLabel)
        setConstraints()
        
    }
    
    private func setConstraints(){
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
            make.width.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        longTextLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
