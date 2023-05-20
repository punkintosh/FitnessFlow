//
//  ProfileAccountHelper.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-20.
//

import FirebaseFirestore

class ProfileAccountHelper {
    static let shared = ProfileAccountHelper()
    
    private let firestoreService = UserAccountService.shared
    private let currentUserID = AuthService.currentUser?.uid
    
    private var userAccountModel: UserAccountModel?
    private var userDocumentListener: ListenerRegistration?
    
    func fetchUserData(completion: @escaping (Result<UserAccountModel, Error>) -> Void) {
        firestoreService.fetchUserDocument(userID: currentUserID!) { result in
            switch result {
            case .success(let userData):
                let userAccountModel = UserAccountModel(
                    firstName: userData["firstName"] as? String ?? "",
                    lastName: userData["lastName"] as? String ?? "",
                    email: userData["email"] as? String ?? "",
                    password: ""
                )
                completion(.success(userAccountModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func startListeningForUserDataChanges(completion: @escaping (Result<UserAccountModel, Error>) -> Void) {
        userDocumentListener = firestoreService.addUserDocumentListener(userID: currentUserID!) { [weak self] result in
            switch result {
            case .success(let userData):
                let userAccountModel = UserAccountModel(
                    firstName: userData["firstName"] as? String ?? "",
                    lastName: userData["lastName"] as? String ?? "",
                    email: userData["email"] as? String ?? "",
                    password: ""
                )
                self?.userAccountModel = userAccountModel
                completion(.success(userAccountModel))
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
