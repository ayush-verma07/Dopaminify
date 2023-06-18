//
//  ContentView.swift
//  SignUp_LogIn
//
//  Created by Ayush on 6/15/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    @EnvironmentObject var viewModel: AuthViewModel
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}

