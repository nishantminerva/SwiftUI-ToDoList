//
//  LoginView.swift
//  ToDoListSwiftUI
//
//  Created by Nishant Minerva on 20/09/23.
//

import SwiftUI

struct LoginView: View {
    
//    @State var email = ""
//    @State var password = ""
//    Now become this
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
//            Header
                HeaderView(title: "To DO List", subTitle: "Get things done", angle: 15, background: Color.pink)

//            Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
//                    TextField("Email Address" , text: $email)
                    TextField("Email Address" , text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                                      DefaultTextFieldStyle()
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    TLButton(title: "Login", background: .blue, action: {
////                        Attempt Login
//                    })
//                    Shorthand
                    TLButton(title: "Login", background: .blue) {
//                        Attempt Login
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
    //            Create Account
                VStack {
                    Text("New Around here?")
//                    Button("Create An Account") {
//    //                    Show registration
//                    }
//                    There are various way of Navigating to other Screen
//                    But we'll do this way NavigationLink instead of Button
                    NavigationLink("Create An Account", destination: RegistrationView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
