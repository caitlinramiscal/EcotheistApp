//
//  AddToDoViewController.swift
//  To Do List
//
//  Created by Cait Ramiscal on 6/28/21.
//

import UIKit

class cAddToDoViewController: UIViewController {

    @IBOutlet weak var ctitleTextField: UITextField!
    @IBOutlet weak var caddButton: UIButton!
    @IBOutlet weak var okaySwitch: UISwitch!
    @IBOutlet weak var goodSwitch: UISwitch!
    @IBOutlet weak var greatSwitch: UISwitch!
    var previousVC = cToDoTableTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        caddButton.layer.cornerRadius = 10
        caddButton.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func caddTapped(_ sender: Any) {
        
//        let toDo = ToDo()
//
//        if let titleText = titleTextField.text {
//            toDo.name = titleText
//            toDo.important = importantSwitch.isOn
//        }
//        previousVC.toDos.append(toDo)
//        previousVC.tableView.reloadData()
//        navigationController?.popViewController(animated: true)
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let ctoDo = CToDoCD(entity: CToDoCD.entity(), insertInto: context)
            
            if let ctitleText = ctitleTextField.text {
                ctoDo.task = ctitleText
                ctoDo.okay = okaySwitch.isOn
                ctoDo.good = goodSwitch.isOn
                ctoDo.great = greatSwitch.isOn
                
            }
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
