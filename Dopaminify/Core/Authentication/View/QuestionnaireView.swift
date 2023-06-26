//
//  QuestionnaireView.swift
//  Dopaminify
//
//  Created by Abhiram Nandiraju on 6/18/23.
//

import SwiftUI

struct QuestionnaireView: View {
    @EnvironmentObject var questionnaireManager: QuestionnaireManager
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        if questionnaireManager.reachedEnd {
                ContentView()
        }
        else
        {
            QuestionView()
                .environmentObject(questionnaireManager)
        }
    }
}

struct QuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView()
            .environmentObject(QuestionnaireManager())
    }
}
