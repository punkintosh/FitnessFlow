//
//  NutritionViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class NutritionViewController: UIViewController {
    private let nutritionView: NutritionView

    init() {
        self.nutritionView = NutritionView()
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
        view.addSubview(nutritionView)
        nutritionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

