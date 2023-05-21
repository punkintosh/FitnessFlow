//
//  AboutWorkoutViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import UIKit
import SnapKit

class AboutWorkoutViewController: UIViewController {
    private let aboutWorkoutView: AboutWorkoutView
    private let workout: CardModel

    init(workout: CardModel) {
        self.workout = workout
        self.aboutWorkoutView = AboutWorkoutView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        aboutWorkoutView.configure(cardModel: workout)
        customizeNavigationBarBackButton()
    }

    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        title = workout.title
        view.addSubview(aboutWorkoutView)
        aboutWorkoutView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(stackViewPressed))
        aboutWorkoutView.stackView.addGestureRecognizer(tapGesture)
        aboutWorkoutView.stackView.isUserInteractionEnabled = true
    }
    
    private func customizeNavigationBarBackButton() {
        // Back Button
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = AppThemeData.colorTextDarkGray
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: AppThemeData.fontSizeTextButton!,
            NSAttributedString.Key.foregroundColor: AppThemeData.colorTextDarkGray
        ]
        backButton.setTitleTextAttributes(attributes, for: .normal)
    }
    
    @objc private func stackViewPressed() {
        let nextViewController = AboutExViewController(exerciseModel: ExerciseModel(id: "", title: "Jumping Jacks", description: "Jumping jacks are a simple and effective exercise that provides a full-body workout. To perform jumping jacks for 20 seconds, start by standing with your feet together and arms by your sides. In one fluid motion, jump up while spreading your legs wider than shoulder-width and raising your arms overhead. As you land, bring your feet back together and lower your arms to the starting position. Repeat this movement for 20 seconds, maintaining a steady pace. Jumping jacks engage your cardiovascular system, improve coordination, and help tone muscles in your legs, arms, and core.", rep: "20s", video: "https://www.youtube.com/watch?v=hugRaDLJSi0"))
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
