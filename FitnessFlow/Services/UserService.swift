//
//  UserService.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-21.
//

import Foundation
import FirebaseFirestore

struct UserService {
    static let shared = UserService()
    
    private let db = Firestore.firestore()
    private let usersCollection = "users"
    
    private init() {}
    
    // Create single user (document)
    func createUserDocument(userID: String, data: [String: Any], completion: @escaping (Result<Void, Error>) -> Void) {
        let userDocumentRef = db.collection(usersCollection).document(userID)
        userDocumentRef.setData(data, merge: true) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    // Fetch single user (document)
    // e.g., users/uid/
    func fetchUserDocument(userID: String, completion: @escaping (Result<[String: Any], Error>) -> Void) -> ListenerRegistration {
        let userDocumentRef = db.collection(usersCollection).document(userID)
        return userDocumentRef.addSnapshotListener { (documentSnapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else if let documentData = documentSnapshot?.data() {
                completion(.success(documentData))
            } else {
                let noDataError = NSError(domain: "FitnessFlow.FirestoreService", code: 0, userInfo: [
                    NSLocalizedDescriptionKey: "No user data found"
                ])
                completion(.failure(noDataError))
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
    
    // Update user fitness data (document)
    func updateUserFitnessData(userID: String, fitnessData: UserFitnessModel, completion: @escaping (Result<Void, Error>) -> Void) {
        let userFitnessData: [String: Any] = [
            "fitnessGoal": fitnessData.fitnessGoal,
            "fitnessLevel": fitnessData.fitnessLevel,
            "weeklyGoal": fitnessData.weeklyGoal
        ]
        
        let userDocumentRef = db.collection(usersCollection).document(userID)
        
        userDocumentRef.updateData(userFitnessData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
