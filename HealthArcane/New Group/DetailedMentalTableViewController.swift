//
//  DetailedMentalTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 23/02/22.
//

import UIKit

class DetailedMentalTableViewController: UITableViewController {

    @IBOutlet weak var Disease: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Symptoms: UILabel!
    @IBOutlet weak var SymptomDescription: UILabel!
    @IBOutlet weak var typesDescription: UILabel!
    
    var name = ""
    var detail = ""
    var symptom = ""
    var typeDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Disease.text = name
        Description.text = detail
        SymptomDescription.text = symptom
        typesDescription.text = typeDescription
    }

    
}
