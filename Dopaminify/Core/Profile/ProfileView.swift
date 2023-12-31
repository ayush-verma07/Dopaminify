//
//  ProfileView.swift
//  Dopaminify
//
//  Created by Ayush on 6/16/23.
//

import SwiftUI
import MessageUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var questionnaireManager: QuestionnaireManager
    @State private var showErrorAlert = false
    @State private var showForgotPasswordView = false
    @State private var showTerms = false
    @State private var showPrivacy = false
    @State private var showUpdate = false
    @State private var showFAQ = false
    @State private var showNotifs = false
    @State private var errorMessage = ""
    @State private var showMailView = false
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                List {
                    Section {
                        HStack {
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(user.email)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    Section("System") {
                        HStack {
                            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color("DarkLight"))
                            
                            Spacer()
                            Text("1.0.0")
                                .foregroundColor(Color("DarkLight"))
                                .font(.subheadline)
                        }
                        Button {
                            showUpdate = true
                        } label: {
                            SettingsRowView(imageName: "clock.fill", title: "Update Log", tintColor: Color("DarkLight"))
                        }
                        .sheet(isPresented: $showUpdate) {
                            UpdateLogView()
                        }
                        
                    }
                    
                    Section("Account"){
                        NavigationLink(destination: yContentView().navigationBarBackButtonHidden(true)) {
                            SettingsRowView(imageName: "pencil", title: "Update Goals", tintColor: Color(.systemBlue))
                        }
                        .navigationBarHidden(true)
                        
                        Button {
                            showForgotPasswordView = true
                        } label: {
                            SettingsRowView(imageName: "lock.rotation", title: "Reset Password", tintColor: Color(.systemBlue))
                        }
                        .sheet(isPresented: $showForgotPasswordView) {
                            forgotPasswordView()
                        }
                        
                        Button {
                            showNotifs = true
                            
                        } label: {
                            SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemOrange))
                        }
                        .sheet(isPresented: $showNotifs){
                            NotificationsView()
                        }
                        
                        
                        Button {
                            viewModel.signOut()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Logout", tintColor: Color(.systemRed))
                        }
                        
                        Button {
                            Task {
                                do {
                                    try await viewModel.deleteAccount()
                                    try viewModel.signOut() // Sign out after successful account deletion
                                    // Handle successful account deletion and sign out
                                } catch let error {
                                    errorMessage = error.localizedDescription
                                    showErrorAlert = true
                                }
                            }
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.systemRed))
                        }
                    }
                    
                    Section("Support"){
                        Button(action: {
                            showMailView = true
                        }) {
                            SettingsRowView(imageName: "hand.thumbsup.fill", title: "Help Center", tintColor: Color(.systemBlue))
                        }
                        
                        Button(action: {
                            showMailView = true
                        }) {
                            SettingsRowView(imageName: "message.fill", title: "Report/Feedback", tintColor: Color(.systemOrange))
                        }
                        
                        Button {
                            showFAQ = true
                        } label: {
                            SettingsRowView(imageName: "questionmark.circle.fill", title: "FAQs", tintColor: Color(.systemGray))
                        }
                        .sheet(isPresented: $showFAQ) {
                            FAQView()
                        }

                    }
                    
                    Section("Legal Information"){
                        Button {
                            showTerms = true
                        } label: {
                            SettingsRowView(imageName: "doc.text.fill", title: "Terms of Service", tintColor: Color(.systemBlue))
                        }
                        .sheet(isPresented: $showTerms) {
                            TermsView()
                        }
                        
                        Button {
                            showPrivacy = true
                        } label: {
                            SettingsRowView(imageName: "lock.circle.fill", title: "Privacy Policy", tintColor: Color(.systemGreen))
                        }
                        .sheet(isPresented: $showPrivacy) {
                            PrivacyPolicyView()
                        }
                    }
                }
                .alert(isPresented: $showErrorAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(errorMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .sheet(isPresented: $showMailView, onDismiss: {
                    // Handle mail view dismissed if needed
                }, content: {
                    MailView()
                })
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthViewModel())
    }
}
