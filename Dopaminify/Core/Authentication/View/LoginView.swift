//
//  LoginView.swift
//  SignUp_LogIn
//
//  Created by Ayush on 6/15/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
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
                        
                        InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    //log  in
                    
                    Button {
                        Task {
                            do {
                                try await viewModel.login(withEmail: email, password: password)
                            } catch let error {
                                errorMessage = error.localizedDescription
                                showError = true
                            }
                        }
                    } label: {
                        HStack {
                            Text("LOGIN")
                                .fontWeight(.bold)
                            Image(systemName: "arrow.turn.up.right")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(.systemBlue))
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .cornerRadius(15)
                    .padding(.top, 24)
                    
                    NavigationLink {
                       forgotPasswordView()
                           .navigationBarBackButtonHidden(false)
                    } label: {
                        HStack {
                            Text("Forgot password?")
                                .fontWeight(.light)
                        }
                        .font(.system(size: 12))
                        .padding(.top, 18)
                    }
                    
                    Spacer()
                    
                    //sign up
                    
                    NavigationLink {
                       SignUpView()
                           .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack(spacing: 5) {
                            Text("Don't have an account?")
                            Text("Sign Up")
                                .fontWeight(.semibold)
                        }
                        .font(.system(size: 18))
                    }
            }
            .alert(isPresented: $showError) {
                print(errorMessage)
                return Alert(
                    title: Text("Error"),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color .white,.yellow]), startPoint: .top, endPoint: .bottom))
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthViewModel())
    }
}
