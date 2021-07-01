//
//  ViewController.swift
//  EcotheistApp
//
//  Created by Cait Ramiscal on 6/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var clothingButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        foodButton.layer.cornerRadius = 10
        foodButton.clipsToBounds = true
        clothingButton.layer.cornerRadius = 10
        clothingButton.clipsToBounds = true
        travelButton.layer.cornerRadius = 10
        travelButton.clipsToBounds = true
        otherButton.layer.cornerRadius = 10
        otherButton.clipsToBounds = true
        // Do any additional setup after loading the view.
    }


}

