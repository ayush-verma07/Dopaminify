//
//  QuestionnaireManager.swift
//  Dopaminify
//
//  Created by Abhiram Nandiraju on 6/22/23.
//

import Foundation
import SwiftUI
import Firebase

class QuestionnaireManager: ObservableObject {
    private(set) var questionnaire: [Questionnaire.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: String = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var answersInDouble: [Double] = []
    @Published private(set) var progress: CGFloat = 0.00

    
    init() {
        Task.init {
            await fetchQuestionnaire()
        }
    }
    
    func answerSelected(answerSelected: Bool) {
        self.answerSelected = answerSelected
    }
    
    func fetchQuestionnaire() async {
        
        do
        {
                let filePath = "/Users/ayush/CongressionalApp/Dopaminify/Dopaminify/QuestionnaireData.json"
                let fileUrl = URL(fileURLWithPath: filePath)
                let jsonData = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(Questionnaire.self, from: jsonData)
                print("Hello there ")
                
                DispatchQueue.main.async {
                    self.questionnaire = decodedData.results
                    self.length = self.questionnaire.count
                    self.setQuestion()
                }
            
            
        }
        catch
        {
            print("Error fetching trivia: \(error)")
        }
        
        
    }
    
    func goToNextQuestion(authModel: AuthViewModel) {
        if index + 1 < length {
            index += 1
            setQuestion()
        }
        else
        {
            reachedEnd = true
            Task {
                await authModel.updateQuestionnaire(user: authModel.currentUser!)
            }
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentQuestionnaireQuestion = questionnaire[index]
            question = currentQuestionnaireQuestion.question
            answerChoices = currentQuestionnaireQuestion.answersToDisplay
            answersInDouble = currentQuestionnaireQuestion.answersInDouble
        }
    }
    
}
