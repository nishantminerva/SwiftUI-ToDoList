//
//  ToDoListItemViewViewModel.swift
//  ToDoListSwiftUI
//
//  Created by Nishant Minerva on 20/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

//ViewModel for single to do list item view (each one in items list)
//Primary Tab
class ToDoItemListViewViewModel: ObservableObject {
//    When when our app first launch
    
    
    init() {
        
    }
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
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
