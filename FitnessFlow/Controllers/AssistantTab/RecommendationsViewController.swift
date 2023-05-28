//
//  RecommendationsViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-29.
//

import UIKit
import SnapKit

class RecommendationsViewController: UIViewController {
    
    private let recommendationsView: RecommendationsView
    private var userModel: UserModel?
    
    init(userModel: UserModel) {
        self.recommendationsView = RecommendationsView()
        self.userModel = userModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        let createQuestion = "Hello! My name is \(userModel!.firstName) \(userModel!.lastName). I need your fitness recommendations. Based on my fitness goal of \(userModel!.fitnessGoal), current fitness level of \(userModel!.fitnessLevel), height \(userModel!.height), weight \(userModel!.weight), age \(userModel!.age), gender \(userModel!.gender), healthConditions \(userModel!.healthConditions), I you suggest suitable exercises or workout routines. What specific type of fitness recommendation are good?"

        
        super.viewDidLoad()
        setupUI()
        recommendationsView.configure(createQuestion: createQuestion)
        customizeNavigationBarBackButton()
        print("----- RecommendationsViewController -----")
        print(userModel!)
        
        OpenAICallerService.shared.getResponse(input: createQuestion) { [weak self] result in
            switch result {
            case .success(let output):
                DispatchQueue.main.async {
                    self?.recommendationsView.answerDataLabel.text = output
                }
            case .failure:
                print("Failed")
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        title = "Recommendation"
        view.addSubview(recommendationsView)
        recommendationsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func customizeNavigationBarBackButton() {
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
    
}
