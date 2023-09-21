//
//  ToDoListView.swift
//  ToDoListSwiftUI
//
//  Created by Nishant Minerva on 20/09/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
//    @StateObject var viewModel = ToDoListViewViewModel()
    @StateObject var viewModel: ToDoListViewViewModel
//    1:58
    @FirestoreQuery var items: [ToDoListItem]
    
//    1:57
//    private let userId: String
    
    init(userId: String) {
//        self.userId = userId
//        users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
//                Looping through all items
                List(items) { item in
//                    Text(item.title)
                    ToDoListItemView(item: item)
//                    Swipe action modifier
                        .swipeActions {
                            Button("Delete") {
//                                Delete
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
//                    Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
//            Presenting the screen
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
        
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "5QkKmCBVoVNUGygO4BcK3UD3Nvf2")
    }
}
