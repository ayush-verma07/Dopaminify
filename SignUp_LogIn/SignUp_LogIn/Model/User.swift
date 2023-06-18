//
//  User.swift
//  SignUp_LogIn
//
//  Created by Ayush on 6/16/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}


extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Julian Alvarez", email: "test@gmail.com")
}
