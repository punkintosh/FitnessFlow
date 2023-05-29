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
    private let usersCollection = "users"
    
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
    
    // Fetch all fitness data (collection) with real-time updates
    func fetchAllFitnessData(userID: String, completion: @escaping (Result<[UserFitnessModel], Error>) -> Void) -> ListenerRegistration {
        let collectionRef = db.collection(usersCollection).document(userID).collection("Fitness Record")
        
        let listener = collectionRef.addSnapshotListener { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let snapshot = snapshot else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data available"])))
                return
            }
            
            var fitnessData: [UserFitnessModel] = []
            
            for document in snapshot.documents {
                let fitnessGoal = document.data()["fitnessGoal"] as? String ?? ""
                let fitnessLevel = document.data()["fitnessLevel"] as? String ?? ""
                let weeklyGoal = document.data()["weeklyGoal"] as? [String] ?? []
                
                let userFitness = UserFitnessModel(fitnessGoal: fitnessGoal, fitnessLevel: fitnessLevel, weeklyGoal: weeklyGoal, updated: document.documentID)
                fitnessData.append(userFitness)
            }
            
            completion(.success(fitnessData))
        }
        
        return listener
    }
    
}
