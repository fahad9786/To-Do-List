//
//  ToDoListItem.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-27.
//

import Foundation

// struct is  value type must use mutation
struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    // checking to see if the model is done
        
    mutating func setDone(_ state: Bool){
        isDone = state
        
        
    }
}
