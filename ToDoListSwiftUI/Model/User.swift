//
//  User.swift
//  ToDoListSwiftUI
//
//  Created by Nishant Minerva on 20/09/23.
//

import Foundation


// This is how our user is going to look like
struct User: Codable {
    let id: String
    let name: String
    let email: String
//    When they joined our app
    let joined: TimeInterval
    
    
}
