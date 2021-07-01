//
//  CompleteToDoViewController.swift
//  To Do List
//
//  Created by Cait Ramiscal on 6/28/21.
//

import UIKit

class cCompleteToDoViewController: UIViewController {

    @IBOutlet weak var ctitleLabel: UILabel!
    @IBOutlet weak var cdeleteButton: UIButton!
    var cpreviousVC = cToDoTableTableViewController()
    var cselectedToDo : CToDoCD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cdeleteButton.layer.cornerRadius = 10
        cdeleteButton.clipsToBounds = true
        ctitleLabel.text = cselectedToDo?.task
        // Do any additional setup after loading the view.
    }
    

    @IBAction func ccompleteTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let ctheToDo = cselectedToDo {
                if let ctheToDo = cselectedToDo {
                    context.delete(ctheToDo)
                    navigationController?.popViewController(animated: true)
                }
            }
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

