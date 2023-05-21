//
//  HomeView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import UIKit
import SnapKit

class HomeView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
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
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextBlack
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppThemeData.colorTextPrimary
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let motivationalQuoteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.text = "\"Success is not final, failure is not fatal: It is the courage to continue that counts.\""
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let bmiLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let fitnessGoalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let fitnessLevelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let weeklyGoalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let workoutSummaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var cards: [CardModel] = []
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        return collectionView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupCollectionView()
    }
    
    let bmiCal = { (height: Double, weight: Double) -> String in
        let heightInMeters = height / 100
        let bmi = weight / (heightInMeters * heightInMeters)
        let formattedBMI = String(format: "%.1f", bmi)
        return formattedBMI
    }
    
    func configure(userModel: UserModel) {
        titleLabel.text = "Good Evening!"
        userNameLabel.text = userModel.firstName + " " + userModel.lastName
        heightLabel.text = "Height: \(userModel.height)"
        weightLabel.text = "Weight: \(userModel.weight)"
        let bmiValue = bmiCal(userModel.height, userModel.weight)
        bmiLabel.text = "Current BMI: \(bmiValue)"
        fitnessGoalLabel.text = "Fitness Goal: \(userModel.fitnessGoal)"
        fitnessLevelLabel.text = "Fitness Level: \(userModel.fitnessLevel)"
        weeklyGoalLabel.text = "Weekly Goal: \(userModel.weeklyGoal)"
        workoutSummaryLabel.text = "Workout Summary"
        
        let card1 = CardModel(title: "Current Workout", caption: "Fat Loose", value: "3 days")
        let card2 = CardModel(title: "Last Excersise", caption: "Push Ups", value: "10")
        
        cards = [card1, card2]
    }
    
    private func setupUI() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(motivationalQuoteLabel)
        contentView.addSubview(heightLabel)
        contentView.addSubview(weightLabel)
        contentView.addSubview(bmiLabel)
        contentView.addSubview(fitnessGoalLabel)
        contentView.addSubview(fitnessLevelLabel)
        contentView.addSubview(weeklyGoalLabel)
        contentView.addSubview(workoutSummaryLabel)
        contentView.addSubview(collectionView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(collectionView.snp.bottom).offset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        motivationalQuoteLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(motivationalQuoteLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        bmiLabel.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        fitnessGoalLabel.snp.makeConstraints { make in
            make.top.equalTo(bmiLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        fitnessLevelLabel.snp.makeConstraints { make in
            make.top.equalTo(fitnessGoalLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        weeklyGoalLabel.snp.makeConstraints { make in
            make.top.equalTo(fitnessLevelLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        workoutSummaryLabel.snp.makeConstraints { make in
            make.top.equalTo(weeklyGoalLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(workoutSummaryLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120) // Set the desired height for the collection view
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    var selectedCard: CardModel? {
        didSet {
            if let card = selectedCard {
                print("Selected Card:")
                print("Title: \(card.title)")
                print("Caption: \(card.caption)")
                print("Value: \(card.value)")
            }
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        let card = cards[indexPath.item]
        cell.configure(card: card)
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Adjust the card size according to your needs
        let cardWidth = collectionView.frame.width * 0.7
        let cardHeight = collectionView.frame.height
        return CGSize(width: cardWidth, height: cardHeight)
    }
    
    // MARK: - Card Select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCard = cards[indexPath.item]
    }
}

