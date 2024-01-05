//
//  TLButton.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-30.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
 
    
    var body: some View {
        
        Button{
            action()
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
                
        
    }
}

#Preview {
    TLButton(title: "Value", background: .pink) {
        // Action
    }
}
