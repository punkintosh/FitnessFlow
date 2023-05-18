//
//  UserModel.swift
//  FitnessFlow
//
//  Created by Punkintosh on 2023-05-18.
//

import Foundation

struct UserModel {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
    init(firstName: String, lastName: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
}
