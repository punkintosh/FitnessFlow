//
//  UserAccountService.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-19.
//

import Foundation
import FirebaseFirestore

struct UserAccountService {
    static let shared = UserAccountService()
    
    private let db = Firestore.firestore()
    private let usersCollection = "users"
    
    private init() {}
    
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
    
    // Fetch user document
    func fetchUserDocument(userID: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let userDocumentRef = db.collection(usersCollection).document(userID)
        userDocumentRef.getDocument { (documentSnapshot, error) in
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
    
    // Add real-time listener for user document changes
    func addUserDocumentListener(userID: String, completion: @escaping (Result<[String: Any], Error>) -> Void) -> ListenerRegistration {
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
}
