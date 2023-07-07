//
//  FAQView.swift
//  Dopaminify
//
//  Created by Ayush on 7/7/23.
//

import SwiftUI

struct FAQView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 26) {
                Text("Frequently Asked Questions")
                    .font(.title2)
                    .fontWeight(.bold)
                                
                FAQsView(question: "What is Dopaminify?", answer: "Dopaminify is a productivity app designed to help users manage their screen time and develop healthy digital habits.")
                FAQsView(question: "How does Dopaminify work?", answer: "Dopaminify allows users to set screen time goals, track their usage, and earn rewards for meeting their goals. It provides insights and charts to help users understand their digital habits.")
                FAQsView(question: "Where can I use Dopaminify?", answer: "Dopaminify is available on iOS and iPadOS. You can sync your data across devices using your Dopaminify account.")
                FAQsView(question: "Is my data secure?", answer: "Dopaminify takes user privacy and data security seriously. All user data is encrypted and stored securely on our database. We adhere to strict privacy policies to ensure the safety of your information.")
                FAQsView(question: "Where is my data being stored?", answer: "Dopaminify is using Google's Firebase database to store user information. Through Firestore's Swift compatibility, we can save your data online through Firebase's servers.")
                FAQsView(question: "How can I contact support?", answer: "If you have any questions, issues, or feedback, you can reach out to our support team at the Help Center or Feedback/Report buttons underneath the Support section of your profile.")
                FAQsView(question: "Are there any in-app purchases?", answer: "Dopaminify does not offer any in-app purchases at this time. However, please continue to check this page for any updates as this page is subject to change.")
            }
            .padding()
            
            Text("If you have any questions or concerns regarding these questions/answers, please contact us through the Support section on your profile.")
                .font(.caption)
                .fontWeight(.bold)
                .padding(.horizontal)
        }
        .navigationTitle("Terms of Service")
    }
}

struct FAQsView: View {
    let question: String
    let answer: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(question)
                .font(.headline)
                .fontWeight(.bold)
            Text(answer)
                .font(.body)
                .foregroundColor(.primary)
        }
    }
}


struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
