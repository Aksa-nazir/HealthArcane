//
//  PDetailTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 16/03/22.
//

import UIKit

class PDetailTableViewController: UITableViewController {
   
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var descriptionlbl: UILabel!
    
    @IBOutlet weak var symptoms: UILabel!
    
    @IBOutlet weak var types: UILabel!
    @IBOutlet weak var exercise: UILabel!
    var some2: physical?
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = some2?.name
        descriptionlbl.text = some2?.description
        symptoms.text = some2?.symptoms
        types.text = some2?.precautionaryMeasures
        exercise.text = some2?.exercise
        
       
    }
}
