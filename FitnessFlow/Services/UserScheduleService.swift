//
//  UserScheduleService.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-28.
//

import Foundation
import FirebaseFirestore

struct UserScheduleService {
    static let shared = UserScheduleService()
    
    private let db = Firestore.firestore()
    private let usersCollection = "users"
    
    private init() {}
    
    // Create single user schedule (document)
    // e.g., users/uid/Schedules/Workouts/2023-05-28/SlcAA7pHCXCno4joXXgi
    func createUserSchedule(userID: String, userScheduleModel: UserScheduleModel, completion: @escaping (Result<Void, Error>) -> Void) {
        let userScheduleDocumentRef = db.collection(usersCollection).document(userID).collection("Schedules").document("Workouts").collection(userScheduleModel.date)
        let userScheduleData: [String: Any] = [
            "muscleGroup": userScheduleModel.muscleGroup,
            "level": userScheduleModel.level,
            "exercise": userScheduleModel.exercise,
            "reps": userScheduleModel.reps,
            "date": userScheduleModel.date
        ]
        userScheduleDocumentRef.addDocument(data: userScheduleData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    // Fetch all schedules (collections)
    func fetchAllSchedules(userID: String, completion: @escaping (Result<[String], Error>) -> Void) {
        let schedulesRef = db.collection(usersCollection).document(userID).collection("Schedules").document("Workouts")
        
        print(schedulesRef.path)
        // users/QdEIl48TklWYpqXNIjHhgXCWKm62/Schedules/Workouts
        
    }
    
}


