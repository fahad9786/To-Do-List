//
//  LoginVIewViewModel.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-27.
//
import FirebaseAuth
import Foundation

class LoginVIewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    
    func login(){
        guard validate() else{
            return
        }
        // try logging in user
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    
    private func validate() -> Bool {
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please enter all fields"
            return false
            
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email"
            return false
        }
        return true
        
    }
    
    
}
