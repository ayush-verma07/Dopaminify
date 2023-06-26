//
//  ProfileView.swift
//  Dopaminify
//
//  Created by Ayush on 6/16/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var questionnaireManager: QuestionnaireManager



    
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
                        
                    }
                    
                    Section("Account"){
                           NavigationLink(destination: yContentView().navigationBarBackButtonHidden(true)) {
                                    SettingsRowView(imageName: "pencil", title: "Update Goals", tintColor: Color(.systemBlue))
                            }
                            .navigationBarHidden(true)
                    
                            Button {
                                viewModel.signOut()
                            } label: {
                                SettingsRowView(imageName: "arrow.left.circle.fill", title: "Logout", tintColor: .red)
                            }

                            Button {
                                Task {
                                    do {
                                        try await viewModel.deleteAccount()
                                        try viewModel.signOut() // Sign out after successful account deletion
                                        // Handle successful account deletion and sign out
                                    } catch {
                                        // Handle error
                                        }
                                    }
                                    } label: {
                                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                                    }
                            }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthViewModel())

    }
}
