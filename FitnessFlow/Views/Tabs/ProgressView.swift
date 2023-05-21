//
//  ProgressView.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class ProgressView: UIView {

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
        label.textColor = .black
        label.font = .systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    let tabHeaderCaption: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let currentProgressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let progressChartView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 4
        return view
    }()
    
    let recentActivitiesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let recentActivitiesTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.rowHeight = 80
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    let followingWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let followingWorkoutsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return collectionView
    }()
    
    let customWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let customWorkoutsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return collectionView
    }()
    
    // MARK: Dummy Data
    let progressData: [Int] = [80, 90, 70, 85, 75, 95, 85]
    
    let recentActivities: [String] = [
        "Ran 5 km",
        "Completed 50 push-ups",
        "Cycled for 30 minutes",
        "Yoga session",
        "Swam for 1 hour"
    ]
    
    let followingWorkouts: [String] = [
        "Leg Day",
        "Upper Body Workout",
        "HIIT Training",
        "Core Strengthening",
        "Cardio Blast"
    ]
    
    let customWorkouts: [String] = [
        "Abs Circuit",
        "Full Body Workout",
        "Pilates Routine",
        "Strength Training",
        "Yoga Flow"
    ]

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configure()
    }

    func configure() {
        tabHeaderTitle.text = "Progress"
        tabHeaderCaption.text = "Visualize achievements"
        currentProgressLabel.text = "Current Progress"
        recentActivitiesLabel.text = "Recent Activities"
        followingWorkoutsLabel.text = "Following Workouts"
        customWorkoutsLabel.text = "My Custom Workouts"
        
        // Register collection view cells
        followingWorkoutsCollectionView.register(WorkoutCell.self, forCellWithReuseIdentifier: "WorkoutCell")
        customWorkoutsCollectionView.register(WorkoutCell.self, forCellWithReuseIdentifier: "WorkoutCell")
        
        // Set data source and delegate
        followingWorkoutsCollectionView.dataSource = self
        followingWorkoutsCollectionView.delegate = self
        customWorkoutsCollectionView.dataSource = self
        customWorkoutsCollectionView.delegate = self
        
        // Set table view data source
        recentActivitiesTableView.dataSource = self
        
        // Create progress bars for each data point
            for (index, progress) in progressData.enumerated() {
                let progressView = UIView()
                progressView.backgroundColor = .blue
                let progressHeight = CGFloat(progress) / 100 * progressChartView.bounds.height
                progressView.frame = CGRect(x: CGFloat(index) * 30, y: progressChartView.bounds.height - progressHeight, width: 20, height: progressHeight)
                progressChartView.addSubview(progressView)
            }
    }

    private func setupUI() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tabHeaderTitle)
        contentView.addSubview(tabHeaderCaption)
        contentView.addSubview(currentProgressLabel)
        contentView.addSubview(progressChartView)
        contentView.addSubview(recentActivitiesLabel)
        contentView.addSubview(recentActivitiesTableView)
        contentView.addSubview(followingWorkoutsLabel)
        contentView.addSubview(followingWorkoutsCollectionView)
        contentView.addSubview(customWorkoutsLabel)
        contentView.addSubview(customWorkoutsCollectionView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(currentProgressLabel.snp.bottom).offset(16)
        }
        
        tabHeaderTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        tabHeaderCaption.snp.makeConstraints { make in
            make.top.equalTo(tabHeaderTitle.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        currentProgressLabel.snp.makeConstraints { make in
            make.top.equalTo(tabHeaderCaption.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        progressChartView.snp.makeConstraints { make in
            make.top.equalTo(currentProgressLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }

        recentActivitiesLabel.snp.makeConstraints { make in
            make.top.equalTo(progressChartView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        recentActivitiesTableView.snp.makeConstraints { make in
            make.top.equalTo(recentActivitiesLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(240)
        }

        followingWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(recentActivitiesTableView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        followingWorkoutsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(followingWorkoutsLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(120)
        }

        customWorkoutsLabel.snp.makeConstraints { make in
            make.top.equalTo(followingWorkoutsCollectionView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        customWorkoutsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(customWorkoutsLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(120)
        }
    }
}

// MARK: - UITableViewDataSource
extension ProgressView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentActivities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = recentActivities[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 16)
        return cell
    }
}

// MARK: - UICollectionViewDataSource
extension ProgressView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == followingWorkoutsCollectionView {
            return followingWorkouts.count
        } else if collectionView == customWorkoutsCollectionView {
            return customWorkouts.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == followingWorkoutsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCell", for: indexPath) as! WorkoutCell
            cell.titleLabel.text = followingWorkouts[indexPath.item]
            return cell
        } else if collectionView == customWorkoutsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCell", for: indexPath) as! WorkoutCell
            cell.titleLabel.text = customWorkouts[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProgressView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 160
        let height: CGFloat = collectionView.bounds.height - 16
        return CGSize(width: width, height: height)
    }
}


// MARK: - WorkoutCell
class WorkoutCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
}
