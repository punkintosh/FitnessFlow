//
//  AboutWorkoutView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import UIKit
import SnapKit

class AboutWorkoutView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppThemeData.colorTextLightGray
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    var workoutCards: [CardModel] = []
    var collectionView = CollectionViewsWrapper.workoutCardCollection(registerClass: WorkoutCardCell.self, cellIdentifier: "WorkoutCardCell")
    var collectionViewHeight = 20
    
    
    let startWorkoutButton = ButtonWrapper.primaryButton(title: "Start Workout")
    let addWorkoutButton = ButtonWrapper.secondaryButton(title: "Add my schedule")
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupCollectionViews()
    }
    
    weak var selectionDelegate: WorkoutSelectionDelegate?
    private func setupCollectionViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configure(cardModel: CardModel) {
        titleLabel.text = cardModel.title
        aboutLabel.text = cardModel.caption + " - " + cardModel.value
    }

    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(aboutLabel)
        contentView.addSubview(collectionView)
        contentView.addSubview(startWorkoutButton)
        contentView.addSubview(addWorkoutButton)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(addWorkoutButton.snp.bottom).offset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        aboutLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(aboutLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(collectionViewHeight)
        }
        
        startWorkoutButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        addWorkoutButton.snp.makeConstraints { make in
            make.top.equalTo(startWorkoutButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
//    func collectionViewHeight() -> CGFloat {
//           let cardHeight: CGFloat = 80
//           let verticalSpacing: CGFloat = 16
//           let numberOfCards = CGFloat(workoutCards.count)
//           let collectionViewHeight = (cardHeight * numberOfCards) + (verticalSpacing * (numberOfCards - 1))
//           return collectionViewHeight
//       }
}
