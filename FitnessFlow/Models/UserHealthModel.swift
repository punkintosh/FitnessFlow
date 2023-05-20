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
    let age: Int
    let gender: String
    let healthConditions: Array<String>
    
    init(height: Double, weight: Double, bmi: Double, age: Int, gender: String, healthConditions: Array<String>) {
        self.height = height
        self.weight = weight
        self.age = age
        self.gender = gender
        self.healthConditions = healthConditions
    }
}

