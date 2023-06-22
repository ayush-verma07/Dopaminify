//
//  User.swift
//  SignUp_LogIn
//
//  Created by Ayush on 6/16/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    
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
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Julian Alvarez", email: "test@gmail.com")
}
