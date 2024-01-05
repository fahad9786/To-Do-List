//
//  ToDoListItemsViewModel.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-27.
//

import Foundation
import FirebaseFirestore

class ToDoListItemsViewModel: ObservableObject{
    @Published var showingNewItemView = false
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    
    
    /// Delete to do list item
    /// - Paramater id: item id to delete
    func delete(id: String) {
            // Implement the deletion logic here
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        }
    }


    
