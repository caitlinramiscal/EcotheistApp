//
//  resourcesViewController.swift
//  EcotheistApp
//
//  Created by Cait Ramiscal on 7/1/21.
//

import UIKit

class resourcesViewController: UIViewController {

    @IBOutlet weak var linkButton1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        linkButton1.addTarget(self, action: #selector(openLink), for: .touchUpInside)

    }
        @objc func openLink() {
        
        if let urlToOpen = URL(string: "https://earth911.com/business-policy/reduce-amazon-packaging-waste/") {
            
            UIApplication.shared.open(urlToOpen, options: [:], completionHandler: nil)
        // Do any additional setup after loading the view.
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
}
