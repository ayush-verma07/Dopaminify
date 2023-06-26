//
//  Answer.swift
//  Dopaminify
//
//  Created by Abhiram Nandiraju on 6/18/23.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var index: Int
}
