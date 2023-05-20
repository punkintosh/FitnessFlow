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
    let weeklyGoal: Int
    
    init(fitnessGoal: String, fitnessLevel: String, weeklyGoal: Int) {
        self.fitnessGoal = fitnessGoal
        self.fitnessLevel = fitnessLevel
        self.weeklyGoal = weeklyGoal
    }
}
