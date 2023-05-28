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

class ProgressViewController: UIViewController {
    private let progressView: ProgressView
    private var userScheduleCollectionListener: ListenerRegistration?

    init() {
        self.progressView = ProgressView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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

    
}

