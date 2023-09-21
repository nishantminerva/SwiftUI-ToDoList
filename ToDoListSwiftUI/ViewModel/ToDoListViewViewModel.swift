//
//  ToDoListViewViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Nishant Minerva on 20/09/23.
//

import Foundation
import FirebaseFirestore

//ViewModel for list of items view
//Primary Tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
//    Delete to do list
    /// Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
//        2:12
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
