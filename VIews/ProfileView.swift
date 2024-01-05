import SwiftUI



func formattedDate(from timeInterval: TimeInterval) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy h:mm a"  // Customize the format as needed
    return dateFormatter.string(from: Date(timeIntervalSince1970: timeInterval))
}



struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        
        NavigationView{
            VStack{
                // Avatar
                if let user = viewModel.user{
                    Image(systemName: "person.circle")
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 125, height: 125)
                        .foregroundColor(Color.blue)
                    
                    // Info: Name, Email, Member since
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Name:")
                                .bold()
                            Text(user.name)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal)

                        HStack {
                            Text("Email:")
                                .bold()
                            Text(user.email)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal)

                        HStack {
                            Text("Member Since:")
                                .bold()
                            Text(formattedDate(from: user.joined))
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal)

                        Spacer()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(16)

                    // Sign out
                    Button("log out"){
                        viewModel.logOut()
                    }
                    .tint(.red)
                    .padding()
                    Spacer()
                    
                }else{
                    Text("Loading profile...")
                }
                
                }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
        
        
        
        
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
