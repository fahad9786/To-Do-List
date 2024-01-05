//
//  RegisterView.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-27.
//
import SwiftUI


struct RegisterView: View {
   @StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start Organizing to dos", angle: -15, background: .orange)
            Spacer()

            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .textFieldStyle(DefaultTextFieldStyle())
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                  
                TLButton(title: "Create Account", background: .green) {
                    // attempt registration
                    viewModel.register()
                }
                
            }
            
            .padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
