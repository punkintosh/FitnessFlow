//
//  WorkoutsViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class WorkoutsViewController: UIViewController, WorkoutSelectionDelegate {
    private let workoutsView: WorkoutsView
    
    init() {
        self.workoutsView = WorkoutsView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        workoutsView.selectionDelegate = self
        setupUI()
        workoutsView.configure()
    }

    private func setupUI() {
        view.backgroundColor = AppThemeData.colorBackgroundLight
        view.addSubview(workoutsView)
        workoutsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // Implement the delegate method
    func didSelectWorkout(_ workout: CardModel) {
        let aboutWorkoutViewController = AboutWorkoutViewController(workout: workout)
        // Present or push the `aboutWorkoutViewController` as needed
        navigationController?.pushViewController(aboutWorkoutViewController, animated: true)
    }
}



