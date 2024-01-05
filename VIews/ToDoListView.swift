import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListItemsViewModel
    @FirestoreQuery var items: [ToDoListItem]

    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(wrappedValue:ToDoListItemsViewModel(userId: userId)
                                      
                                      
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                                
                            }
                                    .tint(.red)
                            
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Add action
                    
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "2LKu2ywoPJUZ1cgKw6W0ypHtD9C2")
    }
}

