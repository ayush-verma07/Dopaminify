//
//  AuthViewModel.swift
//  SignUp_LogIn
//
//  Created by Ayush on 6/16/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?


   init() {
        self.userSession = Auth.auth().currentUser
        Task {
                await fetchUser()
            }
        }

        
    
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("ERROR: Failed to log in with error \(error.localizedDescription)")
            throw error
        }
        
    }
    
    
    func createUser(withEmail email: String, password: String, fullName: String, q1: Double, q2: Double) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullName, email: email, q1: q1, q2: q2)
        
            let encodedUser = user.dictionary
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("ERROR: Failed to create user with error \(error.localizedDescription)")
            throw error
        } 
    }
    
    func updateQuestionnaire(user: User) async {
        do {
            let encodedUser = user.dictionary
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
            print("User updated")
        } catch {
            print("DEBUG: Failed to update user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() //backend
            self.userSession = nil //wipes out user session and takes back to login screen
            self.currentUser = nil //wipes out currwent user data model
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async throws {
            guard let user = Auth.auth().currentUser else {
                throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No authenticated user found"])
            }

            do {
                try await user.delete()
            } catch {
                throw error
            }
        }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        //self.currentUser = try? snapshot.data(as: User.self)
        guard let value = snapshot.data() else { return }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
            self.currentUser = try JSONDecoder().decode(User.self, from: jsonData)
            print("DEBUG: Current user is \(self.currentUser)")
        } catch let error { print (error) }
    }

     
}
