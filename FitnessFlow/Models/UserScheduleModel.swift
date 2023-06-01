//
//  UserScheduleModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-28.
//

import Foundation

struct UserScheduleModel {
    let muscleGroup: String
    let level: String
    let exercise: String
    let reps: String
    let date: String
    
    init(muscleGroup: String, level: String, exercise: String, reps: String, date: String) {
        self.muscleGroup = muscleGroup
        self.level = level
        self.exercise = exercise
        self.reps = reps
        self.date = date
    }
}
