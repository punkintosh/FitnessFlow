//
//  ProgressViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import UIKit
import SnapKit

class ProgressViewController: UIViewController {
    private let progressView: ProgressView

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
        view.backgroundColor = AppThemeData.colorSecondaryWhite
        view.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

