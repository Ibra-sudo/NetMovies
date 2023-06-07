//
//  FirebaseViewModel.swift
//  NetMovies
//
//  Created by Abdulrahman Ibrahim on 12.05.23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirebaseViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var rePassword = ""
    @Published var signedIn = false
    
    let db = Firestore.firestore()
    let auth = Auth.auth()
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func creatUser(email: String, password: String, rePassword: String) {
        
        guard password == rePassword else {
            return
        }
        
        auth.createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            guard let userId = authResult?.user.uid else { return }
            let userData = ["email": email, "userId": userId]
            let userRef = Firestore.firestore().collection("users").document(userId)
            
            userRef.setData(userData) { error in
                if let error = error {
                    print("Error saving user data: \(error.localizedDescription)")
                } else {
                    print("User data saved successfully")
                }
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signIn(email: String, password: String) {
        
        guard !email.isEmpty && !password.isEmpty else {
            return print("Email or password should not be empty!")
        }
        
        auth.signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            
            guard error == nil else {
//                print("error: \(error)")
                print("Email or password is not correct!")
                return
            }

            DispatchQueue.main.async {
                print("Signing in successfuly!")
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}
