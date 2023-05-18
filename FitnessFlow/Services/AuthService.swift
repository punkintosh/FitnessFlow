//
//  AuthService.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-18.
//

import Foundation
import FirebaseAuth

struct AuthService {
    static func signUp(authModel: AuthModel, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: authModel.email, password: authModel.password) { (authResult, error) in
            if let user = authResult?.user {
                completion(.success(user))
            } else if let error = error {
                completion(.failure(error))
            } else {
                // Handle unexpected case or provide a default error
                let defaultError = NSError(domain: "FitnsessFlow.AuthService", code: 0, userInfo: [
                    NSLocalizedDescriptionKey: "An unexpected error occurred during sign up."
                ])
                completion(.failure(defaultError))
            }
        }
    }
    
    static func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let user = authResult?.user {
                completion(.success(user))
            } else if let error = error {
                completion(.failure(error))
            } else {
                // Handle unexpected case or provide a default error
                let defaultError = NSError(domain: "FitnsessFlow.AuthService", code: 0, userInfo: [
                    NSLocalizedDescriptionKey: "An unexpected error occurred during sign in."
                ])
                completion(.failure(defaultError))
            }
        }
    }
    
    static func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
    
    static var currentUser: User? {
        return Auth.auth().currentUser
    }
}

