//
//  WorkoutsView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class WorkoutsView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
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
    
    // MARK: Recommended Workouts
    let recommendedWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var recommendedWorkoutCards: [CardModel] = []
    let collectionViewOne: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(WorkoutCardCell.self, forCellWithReuseIdentifier: "WorkoutCardCell")
        return collectionView
    }()
    
    // MARK: Beginner Workouts
    let beginnerWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var beginnerWorkoutCards: [CardModel] = []
    let collectionViewTwo: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(WorkoutCardCell.self, forCellWithReuseIdentifier: "WorkoutCardCell")
        return collectionView
    }()
    
    // MARK: Intermidate Workouts
    let intermediateWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var intermediateWorkoutCards: [CardModel] = []
    let collectionViewThree: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(WorkoutCardCell.self, forCellWithReuseIdentifier: "WorkoutCardCell")
        return collectionView
    }()
    
    // MARK: Advanced Workouts
    let advancedWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var advancedWorkoutCards: [CardModel] = []
    let collectionViewFour: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(WorkoutCardCell.self, forCellWithReuseIdentifier: "WorkoutCardCell")
        return collectionView
    }()

    
    let longLable = SampleCodes().longText
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupCollectionViews()
    }
    
    func configure() {
        tabHeaderTitle.text = "Workouts"
        tabHeaderCaption.text = "Discover new routines"
        
        // Recommended
        recommendedWorkoutsLabel.text = "Recommended Workouts"
        let card1R = CardModel(id: "", title: "Basic Plan", caption: "Fat Loose", value: "3 days", image: "")
        let card2R = CardModel(id: "", title: "Cardio Heat Plan", caption: "Build Muscles", value: "10 days", image: "")
        recommendedWorkoutCards = [card1R, card2R]
        
        // Beginner
        beginnerWorkoutsLabel.text = "Beginner Workouts"
        let image1B = "https://images.pexels.com/photos/1547248/pexels-photo-1547248.jpeg?auto=compress&cs=tinysrgb&w=1600"
        let image2B = "https://images.pexels.com/photos/2827392/pexels-photo-2827392.jpeg?auto=compress&cs=tinysrgb&w=160"
        let card1B = CardModel(id: "", title: "ABS Beginner", caption: "16 workouts", value: "20 mins", image: image1B)
        let card2B = CardModel(id: "", title: "Chest Beginner", caption: "11 workouts", value: "7 mins", image: image2B)
        let card3B = CardModel(id: "", title: "Arm Beginner", caption: "19 workouts", value: "17 mins", image: "")
        let card4B = CardModel(id: "", title: "Leg Beginner", caption: "23 workouts", value: "26 mins", image: "")
        let card5B = CardModel(id: "", title: "Shoulder & Back Beginner", caption: "17 workouts", value: "17 mins", image: "")
        beginnerWorkoutCards = [card1B, card2B, card3B, card4B, card5B]
        
        // Intermediate
        intermediateWorkoutsLabel.text = "Intermediate Workouts"
        let card1I = CardModel(id: "", title: "ABS Intermediate", caption: "16 workouts", value: "20 mins", image: "")
        let card2I = CardModel(id: "", title: "Chest Intermediate", caption: "11 workouts", value: "7 mins", image: "")
        let card3I = CardModel(id: "", title: "Arm Intermediate", caption: "19 workouts", value: "17 mins", image: "")
        let card4I = CardModel(id: "", title: "Leg Intermediate", caption: "23 workouts", value: "26 mins", image: "")
        let card5I = CardModel(id: "", title: "Shoulder & Back Intermediate", caption: "17 workouts", value: "17 mins", image: "")
        intermediateWorkoutCards = [card1I, card2I, card3I, card4I, card5I]
        
        // Advanced
        advancedWorkoutsLabel.text = "Advanced Workouts"
        let card1A = CardModel(id: "", title: "ABS Advanced", caption: "16 workouts", value: "20 mins", image: "")
        let card2A = CardModel(id: "", title: "Chest Advanced", caption: "11 workouts", value: "7 mins", image: "")
        let card3A = CardModel(id: "", title: "Arm Advanced", caption: "19 workouts", value: "17 mins", image: "")
        let card4A = CardModel(id: "", title: "Leg Advanced", caption: "23 workouts", value: "26 mins", image: "")
        let card5A = CardModel(id: "", title: "Shoulder & Back Advanced", caption: "17 workouts", value: "17 mins", image: "")
        advancedWorkoutCards = [card1A, card2A, card3A, card4A, card5A]
    }

    private func setupUI() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tabHeaderTitle)
        contentView.addSubview(tabHeaderCaption)
        contentView.addSubview(recommendedWorkoutsLabel)
        contentView.addSubview(collectionViewOne)
        contentView.addSubview(beginnerWorkoutsLabel)
        contentView.addSubview(collectionViewTwo)
        contentView.addSubview(intermediateWorkoutsLabel)
        contentView.addSubview(collectionViewThree)
        contentView.addSubview(advancedWorkoutsLabel)
        contentView.addSubview(collectionViewFour)
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
        
        collectionViewOne.snp.makeConstraints { make in
            make.top.equalTo(recommendedWorkoutsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120) // Set the desired height for the collection view
        }
        
        beginnerWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionViewOne.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionViewTwo.snp.makeConstraints { make in
            make.top.equalTo(beginnerWorkoutsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120) // Set the desired height for the collection view
        }
        
        intermediateWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionViewTwo.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionViewThree.snp.makeConstraints { make in
            make.top.equalTo(intermediateWorkoutsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120) // Set the desired height for the collection view
        }
        
        advancedWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionViewThree.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionViewFour.snp.makeConstraints { make in
            make.top.equalTo(advancedWorkoutsLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(120) // Set the desired height for the collection view
        }
        
        longLable.snp.makeConstraints { make in
            make.top.equalTo(collectionViewFour.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupCollectionViews() {
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
        collectionViewThree.delegate = self
        collectionViewThree.dataSource = self
        collectionViewFour.delegate = self
        collectionViewFour.dataSource = self
    }
    
    
    weak var selectionDelegate: WorkoutSelectionDelegate?

    
    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOne {
            return recommendedWorkoutCards.count
        } else if collectionView == collectionViewTwo {
            return beginnerWorkoutCards.count
        } else if collectionView == collectionViewThree {
            return intermediateWorkoutCards.count
        } else if collectionView == collectionViewFour {
            return advancedWorkoutCards.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCardCell", for: indexPath) as! WorkoutCardCell
        
        if collectionView == collectionViewOne {
            let card = recommendedWorkoutCards[indexPath.item]
            cell.configure(card: card)
        } else if collectionView == collectionViewTwo {
            let card = beginnerWorkoutCards[indexPath.item]
            cell.configure(card: card)
        } else if collectionView == collectionViewThree {
            let card = intermediateWorkoutCards[indexPath.item]
            cell.configure(card: card)
        } else if collectionView == collectionViewFour {
            let card = advancedWorkoutCards[indexPath.item]
            cell.configure(card: card)
        }
        
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
        var selectedCard: CardModel?
        if collectionView == collectionViewOne {
            selectedCard = recommendedWorkoutCards[indexPath.item]
        } else if collectionView == collectionViewTwo {
            selectedCard = beginnerWorkoutCards[indexPath.item]
        } else if collectionView == collectionViewThree {
            selectedCard = intermediateWorkoutCards[indexPath.item]
        } else if collectionView == collectionViewFour {
            selectedCard = advancedWorkoutCards[indexPath.item]
        }
        
        if let card = selectedCard {
            selectionDelegate?.didSelectWorkout(card)
        }
    }

}

protocol WorkoutSelectionDelegate: AnyObject {
    func didSelectWorkout(_ workout: CardModel)
}
