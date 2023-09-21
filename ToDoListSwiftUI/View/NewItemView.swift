//
//  NewItemView.swift
//  ToDoListSwiftUI
//
//  Created by Nishant Minerva on 20/09/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
//    Saving the data to the database
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                //                Title
                                TextField("Title", text: $viewModel.title)
                                    .textFieldStyle(DefaultTextFieldStyle())
                                
                //                Due Date
                                DatePicker("Due Date", selection: $viewModel.dueDate)
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                
                //                Button
                                TLButton(title: "Save", background: .pink) {
//                                    viewModel.save()
                                    if viewModel.canSave {
                                        viewModel.save()
                                        newItemPresented = false
                                    } else {
                                        viewModel.showAlert = true
                                    }
//                              Removing our view
                                    newItemPresented = false
                                }
                                    .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {return true}, set: { _ in
            
        }))
    }
}
