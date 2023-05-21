//
//  CardModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import Foundation

struct CardModel {
    let title: String
    let caption: String
    let value: String
    
    init(title: String, caption: String, value: String) {
        self.title = title
        self.caption = caption
        self.value = value
    }
}
