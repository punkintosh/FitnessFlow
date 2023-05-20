//
//  ProfileAccountService.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import FirebaseFirestore

class ProfileAccountService {
    static let shared = ProfileAccountService()
    
    private let firestoreService = FirestoreService.shared
    private let currentUserID = AuthService.currentUser?.uid
    
    private var userModel: UserModel?
    private var userDocumentListener: ListenerRegistration?
    
    func fetchUserData(completion: @escaping (Result<UserModel, Error>) -> Void) {
        firestoreService.fetchUserDocument(userID: currentUserID!) { result in
            switch result {
            case .success(let userData):
                let userModel = UserModel(
                    firstName: userData["firstName"] as? String ?? "",
                    lastName: userData["lastName"] as? String ?? "",
                    email: userData["email"] as? String ?? "",
                    password: ""
                )
                completion(.success(userModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func startListeningForUserDataChanges(completion: @escaping (Result<UserModel, Error>) -> Void) {
        userDocumentListener = firestoreService.addUserDocumentListener(userID: currentUserID!) { [weak self] result in
            switch result {
            case .success(let userData):
                let userModel = UserModel(
                    firstName: userData["firstName"] as? String ?? "",
                    lastName: userData["lastName"] as? String ?? "",
                    email: userData["email"] as? String ?? "",
                    password: ""
                )
                self?.userModel = userModel
                completion(.success(userModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func stopListeningForUserDataChanges() {
        userDocumentListener?.remove()
        userDocumentListener = nil
    }
}
