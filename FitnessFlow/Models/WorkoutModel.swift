//
//  WorkoutModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import Foundation

struct WorkoutModel {
    let muscleGroup: String
    let description: String
    let beginner: Array<String>
    let advanced: Array<String>
    let intermediate: Array<String>
    let images: Array<String>
    let time: Array<Int>
    
    init(muscleGroup: String, description: String, beginner: Array<String>, advanced: Array<String>, intermediate: Array<String>, images: Array<String>, time: Array<Int>) {
        self.muscleGroup = muscleGroup
        self.description = description
        self.beginner = beginner
        self.advanced = advanced
        self.intermediate = intermediate
        self.images = images
        self.time = time
    }
}

struct WorkoutLevelExcersiseModel {
    let name: String
    let description: String
    let reps: String
    let image: String
    let video: String
    
    init(name: String, description: String, reps: String, image: String, video: String) {
        self.name = name
        self.description = description
        self.reps = reps
        self.image = image
        self.video = video
    }
}
