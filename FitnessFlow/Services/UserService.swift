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
    
    // Create User Document
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
}
