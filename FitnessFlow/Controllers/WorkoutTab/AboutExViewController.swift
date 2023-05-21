//
//  AboutExViewController.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import UIKit
import WebKit
import SnapKit

class AboutExViewController: UIViewController {
    private let exerciseModel: ExerciseModel
    private var webView: WKWebView!

    init(exerciseModel: ExerciseModel) {
        self.exerciseModel = exerciseModel
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
        view.backgroundColor = .white

        let titleLabel = UILabel()
        titleLabel.text = exerciseModel.title
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)

        let descriptionLabel = UILabel()
        descriptionLabel.text = exerciseModel.description
        descriptionLabel.textColor = .black
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0

        let repLabel = UILabel()
        repLabel.text = "Rep: \(exerciseModel.rep)"
        repLabel.textColor = .black
        repLabel.font = .systemFont(ofSize: 16)

        webView = WKWebView()

        let videoHTML = """
            <!DOCTYPE html>
            <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
            </head>
            <body style="margin: 0;">
                <div style="position: relative; padding-bottom: 56.25%; height: 0;">
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/hugRaDLJSi0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
            </body>
            </html>
            """

        webView.loadHTMLString(videoHTML, baseURL: nil)

        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, repLabel])
        stackView.axis = .vertical
        stackView.spacing = 16

        view.addSubview(stackView)
        view.addSubview(webView)

        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        webView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.width.equalToSuperview().offset(-32) // Set the width to be equal to the screen width with left and right padding of 16
            make.height.equalTo(webView.snp.width).multipliedBy(9.0/16.0) // Set aspect ratio to 16:9
        }
    }
}

