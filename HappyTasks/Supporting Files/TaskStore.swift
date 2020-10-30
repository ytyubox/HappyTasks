//
//  TaskStore.swift
//  HappyTasks
//
//  Created by Veronica Markova on 10/17/20.
//

import Foundation

class TaskStore{
    
    // The Task array will host our 2 sections.
    
    var tasks = [[Task](), [Task]()]
    
    
    
    // add task
    func add(task: Task, at index: Int, isDone: Bool = false)  {
        let section = isDone ? 1 : 0
        
        tasks[section].insert(task, at: index)
    }
    
    //remove tasks
    
    @discardableResult func removeTask(at index: Int, isDone: Bool = false) -> Task {
        let section = isDone ? 1 : 0
        
        return tasks[section].remove(at: index)
        
//        if index = tasks.first && index < tasks.endIndex {
//           print(tasks[index])
//        }
//    }
    
    
}
}
