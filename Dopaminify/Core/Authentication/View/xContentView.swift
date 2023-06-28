//
//  ContentView.swift
//  Dopaminify
//
//  Created by Abhiram Nandiraju on 6/18/23.
//

import SwiftUI

struct xContentView: View {
    @StateObject var questionnaireManager = QuestionnaireManager()

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {

                VStack(spacing: 20) {
                    Text("Finish Registration")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    Text("Create Your Goals")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                NavigationLink {
                    QuestionnaireView()
                        .environmentObject(questionnaireManager)
                } label: {
                    PrimaryButton(text: "Start")
                }

                Spacer()

                Text("You can always update your answers later.")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(Color.white)
        }
    }
}



struct xContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
