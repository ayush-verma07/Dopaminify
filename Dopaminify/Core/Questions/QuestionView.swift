//
//  QuestionView.swift
//  Dopaminify
//
//  Created by Abhiram Nandiraju on 6/18/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var questionnaireManager: QuestionnaireManager
    @EnvironmentObject var authModel: AuthViewModel
    var count = 0
    
    var body: some View {
        VStack(spacing: 40)
        {
            HStack {
                Text("Questionnaire")
                    .title()
                
                Spacer()
                
                Text("\(questionnaireManager.index + 1) out of \(questionnaireManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
                
            }
            
            ProgressBar(progress: questionnaireManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(questionnaireManager.question)
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                
                
                ForEach(questionnaireManager.answerChoices, id: \.id) {
                    answer in AnswerRow(answer: answer, answerInDouble: questionnaireManager.answersInDouble[answer.index]).environmentObject(questionnaireManager)
                }
                
            }
            
            Button {
                questionnaireManager.goToNextQuestion(authModel: authModel)
            } label: {
                PrimaryButton(text: "Next", background: questionnaireManager.answerSelected ? Color("AccentColor") : .gray)
            }
            .disabled(!questionnaireManager.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background()
        .navigationBarHidden(true)
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuestionnaireManager())
    }
}
