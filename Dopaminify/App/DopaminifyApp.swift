//
//  DopaminifyApp.swift
//  Dopaminify
//
//  Created by Ayush on 6/18/23.
//

import SwiftUI
import Firebase

@main
struct DopaminifyApp: App {
    @StateObject var viewModel = AuthViewModel()
       
       init() {
           FirebaseApp.configure()
       }
       
       var body: some Scene {
           WindowGroup {
               ContentView()
                   .environmentObject(viewModel)
           }
       }
}
