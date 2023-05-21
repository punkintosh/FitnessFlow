//
//  ExerciseModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import Foundation

struct ExerciseModel {
    let id: String
    let title: String
    let description: String
    let rep: String
    let video: String
    
    init(id: String, title: String, description: String, rep: String, video: String) {
        self.id = id
        self.title = title
        self.description = description
        self.rep = rep
        self.video = video
    }
}
