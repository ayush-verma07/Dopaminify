//
//  DopaminifyApp.swift
//  Dopaminify
//
//  Created by Ayush on 6/18/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FamilyControls

@main
struct DopaminifyApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
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

class AppDelegate: NSObject, UIApplicationDelegate {
    @StateObject var screenModel = MyScreenModel.shared
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AuthorizationCenter.shared.requestAuthorization { result in
            switch result {
            case .success:
                self.screenModel.isAuthorized = true
                break
            case .failure(let error):
                print("error for screentime is \(error)")
            }
        }

        _ = AuthorizationCenter.shared.$authorizationStatus
            .sink() {_ in
            switch AuthorizationCenter.shared.authorizationStatus {
            case .notDetermined:
                print("not determined")
            case .denied:
                print("denied")
            case .approved:
                print("approved")
            @unknown default:
                break
            }
        }
        return true
    }
}

