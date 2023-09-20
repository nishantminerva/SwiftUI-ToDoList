//
//  LoginViewViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Nishant Minerva on 20/09/23.
//

//55 min Published
//guard vs if let vs guard

import Foundation
import FirebaseAuth

// ViewModel contains all of the business logic (data which will be used in the screen)
//  Something which we can observe
class LoginViewViewModel: ObservableObject {
//    State var here become this
    @Published var email = ""
    @Published var password = ""
//    - notifing user for error
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
//        Try Login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
//    Checking empty field and correction
    private func validate() -> Bool {
        //        Show that it gets removed for nest time
                errorMessage = ""
        //        Checking does they are empty before logining
        //        To remove space at the ends if user accidently press at the end or start
                guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                    
                    errorMessage = "Please fill in all field"
                    
                    return false
                }
        //        email@foo.com
                guard email.contains("@") && email.contains(".") else {
                    errorMessage = "Please enter valid email"
                    return false
                }
                
        //        print("Called")
        return true
    }
}
