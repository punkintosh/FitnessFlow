//
//  CardModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import Foundation

struct CardModel {
    let id: String
    let title: String
    let caption: String
    let value: String
    let image: String
    
    init(id: String, title: String, caption: String, value: String, image: String) {
        self.id = id
        self.title = title
        self.caption = caption
        self.value = value
        self.image = value
    }
}
