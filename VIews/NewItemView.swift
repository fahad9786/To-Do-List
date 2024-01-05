//
//  NewItemView.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-27.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                            .bold()
                            .font(.system(size: 32))
                            .padding(.top, 100)
                        
                        Form {
                            TextField("Title", text: $viewModel.title)
                                .textFieldStyle(DefaultTextFieldStyle())
                            
                            DatePicker("Due Date", selection: $viewModel.dueDate)
                                .datePickerStyle(GraphicalDatePickerStyle())
                            
                            Button("Save") {
                                if viewModel.canSave{
                                    viewModel.save()
                                    newItemPresented = false
                                }else{
                                    viewModel.showAlert = true
                                }
                            }
                            .padding()
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .alert(isPresented: $viewModel.showAlert){
                            Alert(title: Text("Error"), message: Text("okease fill in all fields and select due date that is today or newer."))
                        }
                    }
                }
            }

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View{
        
    
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {_ in
    }))
}
}
