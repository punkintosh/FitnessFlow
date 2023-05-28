//
//  UserFitnessService.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import Foundation
import Firebase

class UserFitnessService {
    static let shared = UserFitnessService()
    private let db = Firestore.firestore()
    
    private init() {}
    
    // Create User Fitness Document
    func createUserFitnessDocument(userID: String, fitnessData: UserFitnessModel, completion: @escaping (Result<Void, Error>) -> Void) {
        
        let userHealthData: [String: Any] = [
            "fitnessGoal": fitnessData.fitnessGoal,
            "fitnessLevel": fitnessData.fitnessLevel,
            "weeklyGoal": fitnessData.weeklyGoal,
            "updated": fitnessData.updated
        ]
        
        db.collection("users").document(userID).collection("Fitness Record").document(fitnessData.updated).setData(userHealthData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
