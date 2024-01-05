//
//  LogInVIew.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-27.
//
import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginVIewViewModel()
    

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle:34, background: .pink)

              
                
                
                
                // login form
                Form {
            
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textContentType(.emailAddress)  // or .none if you want to disable autocapitalization
                        .textFieldStyle(RoundedBorderTextFieldStyle())


                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)

                // create an account
                VStack {
                    Text("New Around here?")

                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)

                Spacer()
            }
        }
    }
}

// header
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
