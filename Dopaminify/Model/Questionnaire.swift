//
//  Questionnaire.swift
//  Dopaminify
//
//  Created by Abhiram Nandiraju on 6/22/23.
//

import Foundation

struct Questionnaire: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var question: String
        var answers: [String]
        var answersInDouble: [Double]
        
        var answersToDisplay: [Answer] {
            do{
                
                let answersS = try answers.enumerated().map {
                    (index, answer) in Answer(text: try AttributedString(markdown: answer), index: index)
                }
                return answersS
            }
            catch{
                return []
            }
        }
        
    }
}
