//
//  FitnessProgressModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import Foundation

struct FitnessProgressModel {
    let id: String
    let date: Date
    let progress: Int
    let exercise: String
    let userId: String
    
    init(id: String, date: Date, progress: Int, exercise: String, userId: String) {
        self.id = id
        self.date = date
        self.progress = progress
        self.exercise = exercise
        self.userId = userId
    }
}
