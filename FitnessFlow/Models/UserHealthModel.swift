//
//  UserHealthModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import Foundation

struct UserHealthModel {
    let height: Double
    let weight: Double
    let bmi: Double
    let age: Int
    let gender: String
    let fitnessGoal: String
    let fitnessLevel: String
    let healthConditions: Array<String>
    let exercisePreferences: Array<String>
    
    init(height: Double, weight: Double, bmi: Double, age: Int, gender: String, fitnessGoal: String, fitnessLevel: String, healthConditions: Array<String>, exercisePreferences: Array<String>) {
        self.height = height
        self.weight = weight
        self.bmi = bmi
        self.age = age
        self.gender = gender
        self.fitnessGoal = fitnessGoal
        self.fitnessLevel = fitnessLevel
        self.healthConditions = healthConditions
        self.exercisePreferences = exercisePreferences
    }
}

