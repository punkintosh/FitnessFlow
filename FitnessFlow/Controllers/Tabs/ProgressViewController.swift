//
//  ProgressViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit
import MBProgressHUD
import FirebaseFirestore

class ProgressViewController: UIViewController, ProgressViewExtension {
    private let progressView: ProgressView
    private var userScheduleCollectionListener: ListenerRegistration?
    private var userFitnessRecordCollectionListener: ListenerRegistration?
    private var userHealthRecordCollectionListener: ListenerRegistration?
    private var fitnessRecordCards: [CardModel] = []
    private var healthRecordCards: [CardModel] = []
    private let currentUserID = AuthService.currentUser?.uid
    
    init() {
        self.progressView = ProgressView()
        self.progressView.configure()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startListeningForFitnessRecordDataChanges()
        startListeningForHealthRecordDataChanges()
        print("----- ProgressViewController -----")
    }
    
    // Fetch Data from Firestore
    private func startListeningForFitnessRecordDataChanges() {
        userFitnessRecordCollectionListener = UserFitnessService.shared.fetchAllFitnessData(userID: currentUserID!) { [weak self] result in
            switch result {
            case .success(let fitnessData):
                DispatchQueue.main.async { [weak self] in
                    self?.fitnessRecordCards = fitnessData.map { data in
                        return CardModel(id: data.updated, title: data.updated, caption: data.fitnessLevel + "/" + data.fitnessGoal, value: data.weeklyGoal.joined(separator: ", "), image: "https://i.ibb.co/vwfnfsC/fitness.jpg")
                    }
                    self?.progressView.fitnessRecordCards = self?.fitnessRecordCards ?? []
                    
                    // Calculate the new collection view height based on the number of cards
                    let cardHeight: CGFloat = 80
                    let verticalSpacing: CGFloat = 16
                    let numberOfCards = CGFloat(self?.fitnessRecordCards.count ?? 0)
                    let collectionViewHeight = (cardHeight * numberOfCards) + (verticalSpacing * (numberOfCards - 1))
                    
                    // Update the collection view height constraint
                    self?.progressView.collectionViewFitnessRecord.snp.updateConstraints { make in
                        make.height.equalTo(collectionViewHeight)
                    }
                    
                    // Reload the collection view
                    self?.progressView.collectionViewFitnessRecord.reloadData()
                }
                
            case .failure(let error):
                print("Error fetching fitness data: \(error)")
            }
        }
    }
    
    // Fetch Data from Firestore
    private func startListeningForHealthRecordDataChanges() {
        userHealthRecordCollectionListener = UserHealthService.shared.fetchAllHealthData(userID: currentUserID!) { [weak self] result in
            switch result {
            case .success(let healthData):
                DispatchQueue.main.async { [weak self] in
                    self?.healthRecordCards = healthData.map { data in
                        return CardModel(id: data.updated, title: data.updated, caption: "\(data.weight)" + "/" + "\(data.weight)", value: "\(data.age)", image: "https://i.ibb.co/Kbf5Dsh/health.png")
                    }
                    self?.progressView.healthRecordCards = self?.healthRecordCards ?? []
                    
                    // Calculate the new collection view height based on the number of cards
                    let cardHeight: CGFloat = 80
                    let verticalSpacing: CGFloat = 16
                    let numberOfCards = CGFloat(self?.healthRecordCards.count ?? 0)
                    let collectionViewHeight = (cardHeight * numberOfCards) + (verticalSpacing * (numberOfCards - 1))
                    
                    // Update the collection view height constraint
                    self?.progressView.collectionViewHealthRecord.snp.updateConstraints { make in
                        make.height.equalTo(collectionViewHeight)
                    }
                    
                    // Reload the collection view
                    self?.progressView.collectionViewHealthRecord.reloadData()
                }
                
            case .failure(let error):
                print("Error fetching fitness data: \(error)")
            }
        }
    }
    
    
    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        progressView.getScheduleButton.addTarget(self, action: #selector(getScheduleButtonTapped), for: .touchUpInside)
    }
    
    @objc private func getScheduleButtonTapped() {
        print("getScheduleButtonTapped!")
        
        guard let userID = AuthService.currentUser?.uid else {
            // Handle the case when the user ID is not available
            return
        }
        
        // code here
        UserScheduleService.shared.fetchAllSchedules(userID: userID) { result in
            switch result {
            case .success(let schedules):
                // Handle the fetched schedules
                print(schedules)
            case .failure(let error):
                // Handle the error
                print("Error fetching schedules: \(error)")
            }
        }
        
    }
    
    
    // Implement the delegate method
    func didSelectWorkout(cardModel: CardModel) {
        print(cardModel)
    }
}

