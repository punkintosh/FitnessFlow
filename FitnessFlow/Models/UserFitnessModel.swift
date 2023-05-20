//
//  UserFitnessModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import Foundation

struct UserFitnessModel {
    let fitnessGoal: String
    let fitnessLevel: String
    let weeklyGoal: String
    let updated: String
    
    init(fitnessGoal: String, fitnessLevel: String, weeklyGoal: String, updated: String) {
        self.fitnessGoal = fitnessGoal
        self.fitnessLevel = fitnessLevel
        self.weeklyGoal = weeklyGoal
        self.updated = updated
    }
}
