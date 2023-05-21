//
//  WorkoutModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import Foundation

struct WorkoutModel {
    let id: String
    let title: String
    let description: String
    let exercises: [ExerciseModel]
    
    init(id: String, title: String, description: String, exercises: [ExerciseModel]) {
        self.id = id
        self.title = title
        self.description = description
        self.exercises = exercises
    }
}
