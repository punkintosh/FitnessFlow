//
//  AuthModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-18.
//

import Foundation

struct AuthModel {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
