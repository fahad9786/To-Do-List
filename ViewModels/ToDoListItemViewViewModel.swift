//
//  ToDoListItemViewViewModel.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-27.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
// viewmodel for sing;e of items view (each row in items list
// primary tab
class ToDoListItemViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        // cant use this on item as its a constant
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
        
        
    }
    
}


