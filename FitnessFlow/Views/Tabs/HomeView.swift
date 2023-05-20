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
    
    let longTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.text = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sollicitudin nisi non dui pretium, vitae varius urna congue. In eu tincidunt odio. Nunc aliquam ex sed venenatis luctus. Nulla facilisi. Suspendisse viverra urna sed libero volutpat, vel tempus nunc faucibus. Vivamus a leo dapibus, dictum enim vitae, iaculis nibh. Curabitur vitae velit in metus cursus lacinia. Nam commodo, orci in eleifend facilisis, lacus enim lacinia dui, sed vestibulum erat sem in enim. Donec eu lacus ac nisl blandit eleifend in id tortor. Quisque vitae tortor purus. Proin id bibendum dui. Sed efficitur eros a lectus condimentum fringilla. Nam consectetur, leo in rutrum lacinia, urna dui rhoncus ante, sit amet blandit nibh lorem vitae augue.

        Sed at dui quam. Nunc fermentum, velit et tristique consectetur, nunc mi tincidunt risus, non sollicitudin tellus nulla non mauris. Praesent aliquet tellus vel erat tincidunt tristique. Phasellus rhoncus neque a sapien fermentum, eu ultricies nisi fermentum. Duis dapibus sem risus, sed blandit tellus euismod eu. Proin vitae luctus leo. Nulla facilisi. Fusce fermentum diam id ante tempor pulvinar. Ut tincidunt massa eu est interdum ultrices.

        In ut ante in odio congue tincidunt. Cras in tellus vel est scelerisque congue. Nulla eget dictum orci, nec dapibus lacus. Vestibulum feugiat mi sed justo blandit posuere. Nam viverra mauris ac malesuada interdum. Nunc varius urna eu metus tincidunt, et convallis dolor tristique. Morbi ut erat vel tellus tincidunt laoreet. Nulla eu elit orci. Morbi a ullamcorper enim, in dictum orci. Maecenas in diam non felis aliquet tristique. Nulla a velit ut purus facilisis faucibus. In ultricies tortor eu massa rhoncus, eget ultricies lectus aliquam. Integer a tristique mauris, id laoreet dui. Sed rutrum sem eu lorem consequat tempus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque vel sapien eu nibh fermentum rutrum a in orci.
        """
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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(title)
        contentView.addSubview(longTextLabel)
        
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
    
    private func configure() {
        title.text = "Welcome"
    }
}
