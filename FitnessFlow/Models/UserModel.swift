//
//  UserModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import Foundation

struct UserModel {
    // Account
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
    // Health
    let height: Double
    let weight: Double
    let age: Int
    let gender: String
    let healthConditions: Array<String>
    
    // Fitness
    let fitnessGoal: String
    let fitnessLevel: String
    let weeklyGoal: Array<String>
    
    // Changes
    let created: String
    let updated: String
    
    
    init(firstName: String, lastName: String, email: String, password: String, height: Double, weight: Double, age: Int, gender: String, healthConditions: Array<String>, fitnessGoal: String, fitnessLevel: String, weeklyGoal: Array<String>, created: String, updated: String) {
        
        // Account
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        
        // Health
        self.height = height
        self.weight = weight
        self.age = age
        self.gender = gender
        self.healthConditions = healthConditions
        
        // Fitness
        self.fitnessGoal = fitnessGoal
        self.fitnessLevel = fitnessLevel
        self.weeklyGoal = weeklyGoal
        
        // Changes
        self.created = created
        self.updated = updated
    }
}
