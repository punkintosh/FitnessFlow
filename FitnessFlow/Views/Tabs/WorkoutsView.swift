//
//  WorkoutsView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class WorkoutsView: UIView {
    
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
        label.textAlignment = .left
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    let tabHeaderCaption: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppThemeData.colorTextLightGray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    // MARK: Recommended Workouts
    let recommendedWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    // MARK: Abs
    let absWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var absWorkoutCards: [CardModel] = []
    var collectionViewAbs = CollectionViewsWrapper.cardCollection(registerClass: WorkoutCardCell.self, cellIdentifier: "WorkoutCardCell")
    
    // MARK: Chest
    let chestWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var chestWorkoutCards: [CardModel] = []
    var collectionViewChest = CollectionViewsWrapper.cardCollection(registerClass: WorkoutCardCell.self, cellIdentifier: "WorkoutCardCell")
    
    // MARK: Arm
    
    let armWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var armWorkoutCards: [CardModel] = []
    var collectionViewArm = CollectionViewsWrapper.cardCollection(registerClass: WorkoutCardCell.self, cellIdentifier: "WorkoutCardCell")
    
    // MARK: Leg
    
    let legWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var legWorkoutCards: [CardModel] = []
    var collectionViewLeg = CollectionViewsWrapper.cardCollection(registerClass: WorkoutCardCell.self, cellIdentifier: "WorkoutCardCell")
    
    // MARK: Shoulder & Back Workouts
    
    let shoulderNBackWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var shoulderNBackWorkoutCards: [CardModel] = []
    var collectionViewShoulderNBack = CollectionViewsWrapper.cardCollection(registerClass: WorkoutCardCell.self, cellIdentifier: "WorkoutCardCell")
    
    
    let longLable = SampleCodes().longText
    
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
        collectionViewAbs.delegate = self
        collectionViewAbs.dataSource = self
        collectionViewChest.delegate = self
        collectionViewChest.dataSource = self
        collectionViewArm.delegate = self
        collectionViewArm.dataSource = self
        collectionViewLeg.delegate = self
        collectionViewLeg.dataSource = self
        collectionViewShoulderNBack.delegate = self
        collectionViewShoulderNBack.dataSource = self
    }
    
    func configure() {
        tabHeaderTitle.text = "Workouts"
        tabHeaderCaption.text = "Discover new routines"
        
        recommendedWorkoutsLabel.text = "Recommended Workouts"
        absWorkoutsLabel.text = "Abs Workouts"
        chestWorkoutsLabel.text = "Chest Workouts"
        armWorkoutsLabel.text = "Arm Workouts"
        legWorkoutsLabel.text = "Leg Workouts"
        shoulderNBackWorkoutsLabel.text = "Shoulder & Back Workouts"
        
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tabHeaderTitle)
        contentView.addSubview(tabHeaderCaption)
        contentView.addSubview(recommendedWorkoutsLabel)
        contentView.addSubview(absWorkoutsLabel)
        contentView.addSubview(collectionViewAbs)
        contentView.addSubview(chestWorkoutsLabel)
        contentView.addSubview(collectionViewChest)
        contentView.addSubview(armWorkoutsLabel)
        contentView.addSubview(collectionViewArm)
        contentView.addSubview(legWorkoutsLabel)
        contentView.addSubview(collectionViewLeg)
        contentView.addSubview(shoulderNBackWorkoutsLabel)
        contentView.addSubview(collectionViewShoulderNBack)
        contentView.addSubview(longLable)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(longLable.snp.bottom).offset(16)
        }
        
        tabHeaderTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        tabHeaderCaption.snp.makeConstraints { make in
            make.top.equalTo(tabHeaderTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        recommendedWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(tabHeaderCaption.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        absWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(recommendedWorkoutsLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionViewAbs.snp.makeConstraints { make in
            make.top.equalTo(absWorkoutsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120) // Set the desired height for the collection view
        }
        
        chestWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionViewAbs.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionViewChest.snp.makeConstraints { make in
            make.top.equalTo(chestWorkoutsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120) // Set the desired height for the collection view
        }
        
        armWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionViewChest.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionViewArm.snp.makeConstraints { make in
            make.top.equalTo(armWorkoutsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120) // Set the desired height for the collection view
        }
        
        legWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionViewArm.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionViewLeg.snp.makeConstraints { make in
            make.top.equalTo(legWorkoutsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120) // Set the desired height for the collection view
        }
        
        shoulderNBackWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionViewLeg.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionViewShoulderNBack.snp.makeConstraints { make in
            make.top.equalTo(shoulderNBackWorkoutsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120) // Set the desired height for the collection view
        }
        
        longLable.snp.makeConstraints { make in
            make.top.equalTo(collectionViewShoulderNBack.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
}
