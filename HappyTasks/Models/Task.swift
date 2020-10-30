//
//  Task.swift
//  HappyTasks
//
//  Created by Veronica Markova on 10/17/20.
//

import Foundation

class Task {
    
    var name: String
    
    var isDone: Bool
    
    // Initializing isDone as false so whenever we add task is going to be marked not done by default. 
    
    init(name: String, isDone: Bool = false) {
        self.name = name
        self.isDone = isDone
    }

}
