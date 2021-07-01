//
//  ToDoTableTableViewController.swift
//  To Do List
//
//  Created by Cait Ramiscal on 6/28/21.
//

import UIKit

class ToDoTableTableViewController: UITableViewController {

    var toDos : [ToDoCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getToDos()
    }
    override func viewWillAppear(_ animated: Bool) {
    getToDos()
    }
        //toDos = createToDos()
        
        func getToDos() {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                    toDos = coreDataToDos
                    tableView.reloadData()
                    
                    
                    }
                    
        
                    }
                }
            

    

    
//    func createToDos() -> [ToDo] {
//
//        let swift = ToDo()
//        swift.name = "Learn Swift"
//        swift.important = true
//
//        let dog = ToDo()
//        dog.name = "Walk the Dog"
//
//        return [swift, dog]
//
//    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let toDo = toDos[indexPath.row]
    
    performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }


    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name{
            if toDo.important {
                cell.textLabel?.text = "🌎" + name
            } else {
                cell.textLabel?.text = toDo.name
            }
        }
        // Configure the cell...

        return cell
    }
    



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteToDoViewController {
            if let toDo = sender as? ToDoCD {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
    }




}
