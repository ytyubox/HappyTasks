//
//  TasksUtility.swift
//  HappyTasks
//
//  Created by Veronica Markova on 10/22/20.
//

import Foundation

class TasksUtility {
    
     //static let key = "tasks"
    
    // archive
    
    private static func archive( _ tasks: [[Task]]) -> NSData {
        
        
        return NSKeyedArchiver.archivedData(withRootObject: tasks) as NSData }
        
    //fetch
    
func fetch() -> [[Task]]? {
    
    guard let unarchivedData = UserDefaults.standard.object(forKey: "tasks" ) as? Data else {return nil}
    
    return NSKeyedUnarchiver.unarchiveObject(with: unarchivedData) as? [[Task]]
}
    //save
    
    func save( _ tasks: [[Task]]){
    
    //archive
    
        let archivedTasks = TasksUtility.archive(tasks)
    
    //set object for key
    
    UserDefaults.standard.set(archivedTasks, forKey: "tasks")
        
        
        UserDefaults.standard.synchronize()
    
    
    

   
        
}
}
