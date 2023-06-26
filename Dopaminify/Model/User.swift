//
//  User.swift
//  SignUp_LogIn
//
//  Created by Ayush on 6/16/23.
//

import Foundation
import FirebaseFirestoreSwift

class User: Identifiable, Codable {
    var id: String
    var fullName: String
    var email: String
    var q1: Double
    var q2: Double
    
    init(id: String, fullName: String, email: String, q1: Double, q2: Double) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.q1 = q1
        self.q2 = q2
    }
    

    var initials: String {
        let nameComponents = fullName.components(separatedBy: " ")
        let firstLetters = nameComponents.map { component in
            guard let firstCharacter = component.first else { return "" }
            return String(firstCharacter)
        }
        return firstLetters.joined()
    }


    //Added temp
    var dictionary: [String: Any] {
        let data = (try? JSONEncoder().encode(self)) ?? Data()
        return (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) ?? [:]
    }
}


extension User {
    //static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Julian Alvarez", email: "test@gmail.com")
}
