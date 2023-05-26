//
//  WorkoutService.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-25.
//

import Foundation
import FirebaseFirestore

struct WorkoutService {
    static let shared = WorkoutService()
    
    private let db = Firestore.firestore()
    private let workoutsCollection = "workouts"
    
    private init() {}
    
    // Real-time listener for workout document changes
    func fetchWorkoutDocumentListener(completion: @escaping (Result<WorkoutModel, Error>) -> Void) -> ListenerRegistration {
        let workoutDocumentRef = db.collection(workoutsCollection).document("Abs")
        
        return workoutDocumentRef.addSnapshotListener { (documentSnapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let documentData = documentSnapshot?.data(),
                  let muscleGroup = documentData["muscleGroup"] as? String,
                  let description = documentData["description"] as? String,
                  let beginner = documentData["beginner"] as? Array<String>,
                  let advanced = documentData["advanced"] as? Array<String>,
                  let intermediate = documentData["intermediate"] as? Array<String>,
                  let images = documentData["images"] as? Array<String>,
                  let time = documentData["time"] as? Array<Int>
            else {
                let noDataError = NSError(domain: "FitnessFlow.WorkoutService", code: 0, userInfo: [
                    NSLocalizedDescriptionKey: "No workout data found"
                ])
                completion(.failure(noDataError))
                return
            }
            
            let workout = WorkoutModel(muscleGroup: muscleGroup, description: description, beginner: beginner, advanced: advanced, intermediate: intermediate, images: images, time: time)
            
            completion(.success(workout))
        }
    }
    
    // Fetch all workouts
    func fetchAllWorkouts(completion: @escaping (Result<[WorkoutModel], Error>) -> Void) -> ListenerRegistration? {
        return db.collection(workoutsCollection).addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            var workouts: [WorkoutModel] = []
            
            for document in querySnapshot?.documents ?? [] {
                if let muscleGroup = document.data()["muscleGroup"] as? String,
                   let description = document.data()["description"] as? String,
                   let beginner = document.data()["beginner"] as? Array<String>,
                   let advanced = document.data()["advanced"] as? Array<String>,
                   let intermediate = document.data()["intermediate"] as? Array<String>,
                   let images = document.data()["images"] as? Array<String>,
                   let time = document.data()["time"] as? Array<Int> {
                    
                    let workout = WorkoutModel(muscleGroup: muscleGroup, description: description, beginner: beginner, advanced: advanced, intermediate: intermediate, images: images, time: time)
                    
                    workouts.append(workout)
                }
            }
            
            completion(.success(workouts))
        }
    }

    
}
 
