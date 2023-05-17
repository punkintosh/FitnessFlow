//
//  HomeScreen.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-17.
//

import UIKit
import SnapKit

class HomeScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)

        let helloLabel = UILabel()
        helloLabel.text = "FitnessFlow"
        helloLabel.textAlignment = .center
        helloLabel.textColor = UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1.0)
        helloLabel.font = UIFont.boldSystemFont(ofSize: 24)
        helloLabel.translatesAutoresizingMaskIntoConstraints = false

        let sloganLabel = UILabel()
        sloganLabel.text = "Go with the flow and build your fitness."
        sloganLabel.textAlignment = .center
        sloganLabel.textColor = UIColor.gray
        sloganLabel.font = UIFont.systemFont(ofSize: 16)
        sloganLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(helloLabel)
        view.addSubview(sloganLabel)

        helloLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        sloganLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
}


