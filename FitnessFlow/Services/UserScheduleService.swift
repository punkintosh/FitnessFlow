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
    // e.g., users/uid/Schedules/2023-05-28/Abs/Jumping Jacks
    func createUserSchedule(userID: String, userScheduleModel: UserScheduleModel, completion: @escaping (Result<Void, Error>) -> Void) {
        let userScheduleDocumentRef = db.collection(usersCollection).document(userID).collection("Schedules").document(userScheduleModel.date).collection(userScheduleModel.muscleGroup).document(userScheduleModel.exercise)
        let userScheduleData: [String: Any] = [
            "muscleGroup": userScheduleModel.muscleGroup,
            "level": userScheduleModel.level,
            "exercise": userScheduleModel.exercise,
            "reps": userScheduleModel.reps,
            "date": userScheduleModel.date
        ]
        userScheduleDocumentRef.setData(userScheduleData, merge: true) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    // Fetch schedules by muscleGroup (collection)
    // e.g., users/uid/Schedules/2023-05-28/Abs
    func fetchscheduleByMuscleGroup(userID: String, userScheduleModel: UserScheduleModel, completion: @escaping (Result<[UserScheduleModel], Error>) -> Void) {
        let schedulesCollectionRef = db.collection(usersCollection).document(userID).collection("Schedules").document(userScheduleModel.date).collection(userScheduleModel.muscleGroup)
        
        schedulesCollectionRef.getDocuments { querySnapshot, error in
            if let error = error {
                completion(.failure(error))
            } else if let querySnapshot = querySnapshot {
                var userSchedules: [UserScheduleModel] = []
                for document in querySnapshot.documents {
                    let userScheduleData = document.data()
                    let userScheduleModel = UserScheduleModel(
                        muscleGroup: userScheduleData["muscleGroup"] as! String,
                        level: userScheduleData["level"] as! String,
                        exercise: userScheduleData["exercise"] as! String,
                        reps: userScheduleData["reps"] as! String,
                        date: userScheduleData["date"] as! String
                    )
                    userSchedules.append(userScheduleModel)
                }
                completion(.success(userSchedules))
            }
        }
    }
    
    // Fetch all schedules and document IDs (collection)
    // e.g., users/uid/Schedules/
    
}


