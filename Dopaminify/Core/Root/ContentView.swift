//
//  ContentView.swift
//  Dopaminify
//
//  Created by Ayush on 6/15/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.userSession != nil {
                TabView {
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                    DashboardView()
                        .tabItem {
                            Image(systemName: "desktopcomputer")
                            Text("Dashboard")
                        }
                    AboutView()
                        .tabItem {
                            Image(systemName: "info.circle")
                            Text("About")
                        }
                }
                .accentColor(.blue)
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

