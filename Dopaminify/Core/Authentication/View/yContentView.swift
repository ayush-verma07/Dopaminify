//
//  yContentView.swift
//  Dopaminify
//
//  Created by Ayush on 6/26/23.
//

import SwiftUI

struct yContentView: View {
    @StateObject var questionnaireManager = QuestionnaireManager()

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {

                VStack(spacing: 20) {
                    Text("Update Goals")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Change Answers")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                NavigationLink {
                    QuestionnaireView().environmentObject(questionnaireManager)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    PrimaryButton(text: "Update")
                }

                Spacer()

                Text("You can always update your answers again later.")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color.white)
        }
    }
}



struct yContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
