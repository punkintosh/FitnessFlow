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
    
    let exNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let exReptLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppThemeData.colorTextLightGray
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func configure(cardModel: CardModel) {
        titleLabel.text = cardModel.title
        aboutLabel.text = "cardModel.caption" + " - " + "cardModel.values"
        
        let exercises = [
            ("Jumping Jacks", "20 seconds"),
            ("Abdominal Crunches", "30 seconds"),
            ("Russian Twist", "20 seconds"),
            ("Mountain Climber", "30 seconds"),
            ("Hell Touch", "20 seconds"),
            ("Leg Raises", "30 seconds"),
            ("Plank", "30 seconds"),
            ("Russian Twist", "20 seconds"),
            ("Mountain Climber", "30 seconds"),
            ("Hell Touch", "20 seconds"),
            ("Leg Raises", "30 seconds"),
            ("Cobra Stretch", "30 seconds")
        ]
        
        stackView.arrangedSubviews.forEach { view in
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        for (exercise, repetition) in exercises {
            let exerciseLabel = UILabel()
            exerciseLabel.textColor = .black
            exerciseLabel.font = .systemFont(ofSize: 18, weight: .semibold)
            exerciseLabel.text = exercise
            stackView.addArrangedSubview(exerciseLabel)
            
            let repetitionLabel = UILabel()
            repetitionLabel.textColor = AppThemeData.colorTextLightGray
            repetitionLabel.font = .systemFont(ofSize: 16, weight: .semibold)
            repetitionLabel.text = repetition
            stackView.addArrangedSubview(repetitionLabel)
        }
    }

    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(aboutLabel)
        contentView.addSubview(stackView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(stackView.snp.bottom).offset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        aboutLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        stackView.snp.makeConstraints { make in
                make.top.equalTo(aboutLabel.snp.bottom).offset(16)
                make.leading.trailing.equalToSuperview().inset(16)
            }
        
        stackView.addArrangedSubview(exNameLabel)
            stackView.addArrangedSubview(exReptLabel)
    }
}
