//
//  ToDoTableTableViewController.swift
//  To Do List
//
//  Created by Cait Ramiscal on 6/28/21.
//

import UIKit

class cToDoTableTableViewController: UITableViewController {

    var ctoDos : [CToDoCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        cgetToDos()
    }
    override func viewWillAppear(_ animated: Bool) {
    cgetToDos()
    }
        //toDos = createToDos()

        func cgetToDos() {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                if let coreDatacToDos = try? context.fetch(CToDoCD.fetchRequest()) as? [CToDoCD] {
                    ctoDos = coreDatacToDos
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
        return ctoDos.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let ctoDo = ctoDos[indexPath.row]

    performSegue(withIdentifier: "cmoveToComplete", sender: ctoDo)
    }





    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ccell = tableView.dequeueReusableCell(withIdentifier: "creuseIdentifier", for: indexPath)

        let ctoDo = ctoDos[indexPath.row]

        if let task = ctoDo.task {
            if ctoDo.okay {
                ccell.textLabel?.text = "♥️" + task
            } else if ctoDo.good {
                ccell.textLabel?.text = "💙" + task
            } else if ctoDo.great {
                ccell.textLabel?.text = "💚" + task
            } else {
                ccell.textLabel?.text = ctoDo.task
            }
        }
        // Configure the cell...

        return ccell
    }





    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let caddVC = segue.destination as? cAddToDoViewController {
            caddVC.previousVC = self
        }
        if let ccompleteVC = segue.destination as? cCompleteToDoViewController {
            if let ctoDo = sender as? CToDoCD {
                ccompleteVC.cselectedToDo = ctoDo
               ccompleteVC.cpreviousVC = self
            }
        }
    }




}
