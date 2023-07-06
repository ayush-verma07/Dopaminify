//
//  forgotPasswordView.swift
//  Dopaminify
//
//  Created by Ayush on 7/5/23.
//

import SwiftUI

struct forgotPasswordView: View {
    @State private var email = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showAlert = false
    @State private var showError = false
    @State private var errorMessage = ""

    
    var body: some View {
            NavigationStack {
                VStack {
                    //logo
                    Image("testy")
                        .resizable()
                        .scaledToFill()
                        .frame(width:150, height:150)
                        .padding(.vertical, 32)
                    
                    //form fields
                    VStack(spacing: 24) {
                        InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                            .autocapitalization(.none)
                                            }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    //button
                    
                    Button {
                        Task {
                            do {
                                try await viewModel.forgotPass(withEmail: email)
                                showAlert = true
                            } catch let error {
                                errorMessage = error.localizedDescription
                                showError = true
                            }
                        }
                    } label: {
                        HStack {
                            Text("SEND")
                                .fontWeight(.bold)
                            Image(systemName: "envelope")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(.systemBlue))
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .cornerRadius(15)
                    .padding(.top, 24)
                    
                    Spacer()
            }
            .alert(isPresented: $showError) {
                print(errorMessage)
                return Alert(
                    title: Text("Error"),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .alert(isPresented: $showAlert) {
                print(errorMessage)
                return Alert(
                    title: Text("Success"),
                    message: Text("A password reset email has been sent."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color .white,.yellow]), startPoint: .top, endPoint: .bottom))
        }
    }
}

extension forgotPasswordView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
    }
}

struct forgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        forgotPasswordView()
    }
}

