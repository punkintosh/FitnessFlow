//
//  UserHealthService.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import Foundation
import Firebase

class UserHealthService {
    static let shared = UserHealthService()
    private let db = Firestore.firestore()
    private let usersCollection = "users"
    
    private init() {}
    
    // Create User Health Document
    func createUserHealthDocument(userID: String, healthData: UserHealthModel, completion: @escaping (Result<Void, Error>) -> Void) {
        
        let userHealthData: [String: Any] = [
            "height": healthData.height,
            "weight": healthData.weight,
            "age": healthData.age,
            "gender": healthData.gender,
            "healthConditions": healthData.healthConditions,
            "updated": healthData.updated
        ]
        
        db.collection("users").document(userID).collection("Health Record").document(healthData.updated).setData(userHealthData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    // Update user health data (document)
    func updateUserHealthData(userID: String, healthData: UserHealthModel, completion: @escaping (Result<Void, Error>) -> Void) {
        let userHealthData: [String: Any] = [
            "height": healthData.height,
            "weight": healthData.weight,
            "age": healthData.age,
            "gender": healthData.gender,
            "healthConditions": healthData.healthConditions,
            "updated": healthData.updated
        ]
        
        let userDocumentRef = db.collection(usersCollection).document(userID)
        
        userDocumentRef.updateData(userHealthData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
