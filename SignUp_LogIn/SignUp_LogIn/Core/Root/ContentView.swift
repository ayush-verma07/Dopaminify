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
        if $viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel())
    }
}
