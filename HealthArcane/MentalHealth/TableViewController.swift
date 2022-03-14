//
//  TableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 12/03/22.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var descriptionlbl: UILabel!
    
    @IBOutlet weak var symptoms: UILabel!
    
    
    @IBOutlet weak var types: UILabel!
    
    
    var some: HeroStats?
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = some?.name
        descriptionlbl.text = some?.description
        symptoms.text = some?.symptoms
        types.text = some?.types
       
    }

   


}
