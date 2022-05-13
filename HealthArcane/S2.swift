//
//  S2.swift
//  HealthArcane
//
//  Created by aksa nazir on 08/05/22.
//

import UIKit

class S2: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func Q6YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayHeart.append(1)
        
        
    }
    @IBAction func Q6NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayHeart.append(-1)
    }
    @IBAction func Q7YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(1)
        
    }
    @IBAction func Q7NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(-1)
    }
    @IBAction func Q8YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(1)
        arrayfattyLiver.append(1)
        arrayPancreaticCancer.append(1)
    }
    @IBAction func Q8NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(-1)
        arrayfattyLiver.append(-1)
        arrayPancreaticCancer.append(-1)
    }
    @IBAction func Q9YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayKidney.append(1)
    }
    @IBAction func Q9NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayKidney.append(-1)
    }
    @IBAction func Q10YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayPancreaticCancer.append(1)
    }
    @IBAction func Q10NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayPancreaticCancer.append(-1)
    }
    
    @IBAction func next2(_ sender: Any) {
        
        sumKidney = arrayKidney.reduce(0, +)
        print(sumKidney)
}
}
