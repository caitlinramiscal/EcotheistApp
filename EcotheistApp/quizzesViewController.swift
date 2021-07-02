//
//  quizzesViewController.swift
//  EcotheistApp
//
//  Created by Cait Ramiscal on 7/1/21.
//

import UIKit

class quizzesViewController: UIViewController {

    @IBOutlet weak var linkButton2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        linkButton2.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func openLink() {
    
    if let urlToOpen = URL(string: "https://directory.goodonyou.eco/brand/shein") {
        
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
