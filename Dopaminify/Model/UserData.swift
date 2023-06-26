//
//  UserData.swift
//  Dopaminify
//
//  Created by Ayush on 6/23/23.
//

import Foundation
import FirebaseFirestoreSwift

struct UserData: Codable {
    let q1: Double
    let q2: Double
    let q3: String



    //Added temp
    var dictionary: [String: Any] {
        let data = (try? JSONEncoder().encode(self)) ?? Data()
        return (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) ?? [:]
    }
}

