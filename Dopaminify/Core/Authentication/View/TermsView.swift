//
//  TermsView.swift
//  Dopaminify
//
//  Created by Ayush on 7/10/23.
//

import SwiftUI

struct TermsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                Text("Terms of Service")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TermView(number: "1", title: "Introduction", description: "These Terms of Service (Terms) govern your access to and use of the Dopaminify application (Dopaminify or the App) provided by Dopaminify Inc. (Company, we, us, or our). By accessing or using the Dopaminify App, you agree to be bound by these Terms.")
                TermView(number: "2", title: "Acceptance of Terms", description: "By accessing or using Dopaminify, you acknowledge that you have read, understood, and agree to be bound by these Terms and any additional guidelines or rules applicable to specific features or services within the App.")
                TermView(number: "3", title: "Use of the App", description: "Dopaminify is designed to help users track and manage their screen time and digital habits. You must use the App in compliance with all applicable laws and regulations. The App is intended for personal use only, and you may not use it for any commercial purposes.")
                TermView(number: "4", title: "User Accounts", description: "To access certain features of Dopaminify, you may need to create a user account. You are responsible for maintaining the confidentiality of your account credentials and for any activities that occur under your account. You agree to provide accurate and complete information during the registration process and to update your information as necessary.")
                TermView(number: "5", title: "Privacy", description: "Your privacy is important to us. Please refer to our Privacy Policy to understand how we collect, use, and protect your personal information.")
                TermView(number: "6", title: "Intellectual Property", description: "The App and its content, including but not limited to text, graphics, images, logos, and software, are the property of the Company or its licensors and are protected by intellectual property laws. You may not reproduce, modify, distribute, or otherwise use any portion of the App without our prior written consent.")
                TermView(number: "7", title: "Disclaimer of Warranties", description: "Dopaminify is provided on an as is and as available basis. We do not guarantee the accuracy, reliability, or availability of the App or its content.")
                TermView(number: "8", title: "Limitation of Liability", description: "In no event shall the Company be liable for any direct, indirect, incidental, special, consequential, or punitive damages arising out of or in connection with your use of Dopaminify.")
            }
            .padding()
            
            Text("By using Dopaminify, you agree to comply with these Terms. If you do not agree with any part of these Terms, please refrain from accessing or using the App. If you have any questions or concerns regarding these Terms, please contact us through the Support section on your profile.")
                .font(.caption)
                .fontWeight(.bold)
                .padding(.horizontal)
        }
        .navigationTitle("Terms of Service")
    }
}

struct TermView: View {
    let number: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(number)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.trailing, 8)
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            
            Text(description)
                .font(.body)
                .foregroundColor(.primary)
        }
    }
}


struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView()
    }
}
