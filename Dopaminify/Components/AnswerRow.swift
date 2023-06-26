//
//  AnswerRow.swift
//  Dopaminify
//
//  Created by Abhiram Nandiraju on 6/18/23.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var questionnaireManager: QuestionnaireManager
    @EnvironmentObject var viewModel: AuthViewModel
    
    var answer: Answer
    var answerInDouble: Double
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: "checkmark.circle.fill")
                   // .foregroundColor(.gray)
            }
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(questionnaireManager.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
            .background(.white)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
            .onTapGesture{
                if !questionnaireManager.answerSelected {
                    isSelected = true
                    selectAnswer(authModel: viewModel, idx: questionnaireManager.index, answerInDouble: answerInDouble)
                    questionnaireManager.answerSelected(answerSelected: true)
                }
            }
        
        
    }
}

func selectAnswer(authModel: AuthViewModel, idx: Int, answerInDouble: Double) {
    Task {
//        let ans = answersInDouble
        let ans = answerInDouble
        print(ans)
        if idx == 0 {
            await authModel.currentUser?.q1 = answerInDouble
        } else if idx == 1 {
            await authModel.currentUser?.q2 = answerInDouble
        }
    }
}

//struct AnswerRow_Previews: PreviewProvider {
//    static var previews: some View {
//        AnswerRow(answer: Answer(text: "Single"), answerInDouble: <#T##Double#>: 0.0)
//            .environmentObject(QuestionnaireManager())
//    }
//}
