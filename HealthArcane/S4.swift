//
//  survey3ViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 18/04/22.
//

import UIKit

class S4: UITableViewController {

    
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func submit(_ sender: Any) {
        result.alpha = 1
    }
  

}
