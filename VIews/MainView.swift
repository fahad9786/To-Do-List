//
//  ContentView.swift
//  To Do List
//
//  Created by Fahad Sheikh on 2023-10-26.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accountView
            // signed in
            
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        
        TabView{
            // add new image for newer
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem { Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
        
    }
}

#Preview {
    MainView()
}
