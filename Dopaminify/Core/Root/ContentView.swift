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
        if viewModel.currentUser != nil {
            if viewModel.currentUser?.q1 == 20.0 {
                xContentView()
            } else {
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
                   RewardsView()
                       .tabItem {
                           Image(systemName: "gift")
                           Text("Rewards")
                       }
                   AboutView()
                       .tabItem {
                           Image(systemName: "info.circle")
                           Text("About")
                       }
                }
                .accentColor(.blue)
                
            }
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


