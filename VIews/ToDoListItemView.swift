//
//  ToDoListItemView.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-27.
//

import SwiftUI

struct ToDoListItemView: View {
    let item: ToDoListItem
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.darkGray))

            }
            
            Spacer()

            Button{
                viewModel.toggleIsDone(item: item)
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
                    .foregroundColor(Color.blue)
            }
            
            

        }
        
    }
}


struct ToDoListItemView_Preview: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(
            id: "123",
            title: "Get Milj",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false))
    }
}
