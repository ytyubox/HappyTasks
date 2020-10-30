//
//  TasksController.swift
//  HappyTasks
//
//  Created by Veronica Markova on 10/17/20.
//

import UIKit

class TasksController: UITableViewController {
    
    var taskStore = TaskStore()
    
    
    //MARK: LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //remloving the line separator
        tableView.tableFooterView = UIView()
        
        //creating some tasks
        
        let toDoTasks = [Task.init(name: "Meditate"), Task.init(name: "Cinema with Viki"), Task.init(name: "Play some chess")]
        
        let doneTasks = [Task.init(name: "Code"), Task.init(name: "Eat some chocolates :D")]
        
        taskStore.tasks = [toDoTasks, doneTasks]
    }
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        
        
        
        //MARK: AlertController
        
        
        //Setting up the alert controller
        
        let alertController = UIAlertController(title: "Add a Happy Task", message: nil, preferredStyle: .alert)
        
        // Set up the action
    
        let addAction = UIAlertAction(title: "Add", style: .default) {
            
            _ in
            
            //text field
            guard let name = alertController.textFields?.first?.text else {
                return
            }
            
            //Create task
            
            let newTask = Task(name: name)
            
            //Add task
            
            self.taskStore.add(task: newTask, at: 0)
            
            // reload data in table view
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        

        // Add the text field
        
        alertController.addTextField { textfield in
            textfield.placeholder = "Enter a happy task here..."
          
            //add the actions
            
            alertController.addAction(addAction)
            
            alertController.addAction(cancelAction)
            
            //present it
            
            self.present(alertController, animated: true)
        
            
//
        }
        }
        

}


// MARK: DataSource


extension TasksController {
    
   
    
    
   
    // Implementing the sections
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Happy To-Do"
        }else{
            return "Happily Done"
        }
    }
    
    //Dynamic sections.
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return taskStore.tasks.count
    }
    
    
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Able to grab the appropiate section.
        
        return taskStore.tasks[section].count
        
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskStore.tasks[indexPath.section][indexPath.row].name
        return cell

}
    
    

}

//MARK: Delegate

extension TasksController{
    
    // Height of the section
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 53
    }
    
    // Implementing the Delete Row actions/ Icon.
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil){ ( action, sourceView, completionHandler) in
        
        
        
        //determine whether the task is done
        
        let isDone = self.taskStore.tasks[indexPath.section][indexPath.row].isDone
        
        // remove the task from the table view
        self.taskStore.removeTask(at: indexPath.row, isDone: isDone)
        
            
           
        //reload table view
        
        
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        //Indicate that the action was perfomed
        completionHandler(true)
        
     
        
    }
        
        
        // Seting up the image and the background color
        
        deleteAction.image = UIImage(named: "delete")
       
        deleteAction.backgroundColor = UIColor(displayP3Red: 0.5, green: 0.2, blue: 0.2, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
}
    
    //Done Action
    
override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    
    let doneAction = UIContextualAction(style: .normal, title: nil) { (action, sourceView, completionHandler) in
        
    
    
    //Task is done
    self.taskStore.tasks[0][indexPath.row].isDone = true
    
    
    //Remove the task from array
    
    let doneTask = self.taskStore.removeTask(at: indexPath.row)
    
    
    
    //reload table view
    
    tableView.deleteRows(at: [indexPath], with: .automatic)
    
    // add taks
    
    self.taskStore.add(task: doneTask, at: 0, isDone: true)
    
    // reload data
    
    tableView.insertRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
    
    completionHandler(true)
    }
    
    // seting up the image and the background color
    doneAction.image = UIImage(named: "Done")
    doneAction.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    return indexPath.section == 0 ? UISwipeActionsConfiguration(actions: [doneAction]) : nil
}
    
}
    
    
    
    
    




