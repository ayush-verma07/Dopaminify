//
//  PrivacyPolicyView.swift
//  Dopaminify
//
//  Created by Ayush on 7/15/23.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Privacy Policy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Effective Date: 6 July 2023")
                    .font(.subheadline)
                
                
                PrivacyPolicySection(number: "", title: "", description: "This Privacy Policy describes how Dopaminify (we, us, or our) collects, uses, and shares information about users (you or users) of the Dopaminify mobile application (the App).")
                PrivacyPolicySection(number: "1", title: "Information We Collect", description: "(a) User Account Information: When you create an account on Dopaminify, we collect your email address, first and last name, and other relevant information to set up and manage your user account.                                                                        (b) Usage Data: We collect information about your use of the App, including screen time data, goals, challenges, and other related activities. This data is used to provide personalized insights and recommendations to help you manage your digital habits effectively.                                                         (c) Device Information: We may collect device-specific information, such as device screen time, operating system version, and device model, to ensure the proper functioning of the App and improve user experience.")
                PrivacyPolicySection(number: "2", title: "How We Use Your Information", description: "(a) Personalization: We use the collected information to personalize your experience within the App, including styling your profile, providing tailored insights, recommendations, and challenges based on your goals and usage patterns.                                                              (b) Analytics and Improvements: We analyze user data to understand usage patterns, identify trends, and improve the functionality and features of the App. This helps us enhance user experience and address any technical issues.")
                PrivacyPolicySection(number: "3", title: "Data Sharing and Security", description: "(a) Third-Party Service Providers: We may share certain information with trusted third-party service providers who assist us in operating the App, such as cloud storage providers and analytics platforms. These providers are contractually bound to protect your information and only use it for specified purposes.                                                                     (b) Data Security: We implement reasonable security measures to protect your information from unauthorized access, disclosure, or alteration. However, please note that no method of data transmission or storage is entirely secure, and we cannot guarantee absolute security.")
                PrivacyPolicySection(number: "4", title: "Children's Privacy", description: "Dopaminify is not intended for use by children under the age of 13 without parental authorization. We do not knowingly collect personal information from children. If we become aware that we have inadvertently collected personal information from a child under 13, we will promptly delete it from our records.")
                PrivacyPolicySection(number: "5", title: "Your Choices and Rights", description: "(a) Account Management: You can update your account information and communication preferences within the App. You may also delete your account or change login credentials at any given time.                                                                    (b) Opt-Out: You can opt out of certain data collection and usage by adjusting your device settings or discontinuing the use of the App. However, please note that this may limit your access to certain features.")
                PrivacyPolicySection(number: "6", title: "Changes to this Privacy policy", description: "We reserve the right to update or modify this Privacy Policy at any time. Any changes will be effective upon posting the updated Privacy Policy within the App. Your continued use of the App after the effective date constitutes your acceptance of the updated Privacy Policy.")
                
                Text("By using Dopaminify, you agree to comply with this Privacy Policy. If you do not agree with any part of this Privacy Policy, please refrain from accessing or using the App. If you have any questions or concerns regarding this Privacy Policy, please contact us through the Support section on your profile.")
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .padding()
        }
        .navigationTitle("Privacy Policy")
    }
}

struct PrivacyPolicySection: View {
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

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
