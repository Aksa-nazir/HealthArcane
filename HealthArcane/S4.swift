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
    @IBAction func Q16YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayfattyLiver.append(1)
        arrayKidney.append(1)
        arrayPancreaticCancer.append(1)
        
    }
    @IBAction func Q16NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayfattyLiver.append(-1)
        arrayKidney.append(-1)
        arrayPancreaticCancer.append(-1)
    }
    @IBAction func Q17YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayHeart.append(1)
    }
    @IBAction func Q17NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayHeart.append(-1)
    }
    @IBAction func Q18YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayfattyLiver.append(1)
    }
    @IBAction func Q18NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayfattyLiver.append(-1)
    }
    @IBAction func Q19YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayHeart.append(1)
    }
    @IBAction func Q19NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayHeart.append(-1)
    }
    @IBAction func Q20YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(1)
    }
    @IBAction func Q20NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(-1)
    }
    

    @IBAction func submit(_ sender: Any) {
        result.alpha = 1
        sumKidney = arrayKidney.reduce(0, +)
        print(sumKidney)
        sumHeart = arrayHeart.reduce(0, +)
        print(sumHeart)
        sumDiabetes = arrayDiabetes.reduce(0, +)
        print(sumDiabetes)
        sumFattyliver = arrayfattyLiver.reduce(0, +)
        print(sumFattyliver)
        sumPancreaticcancer = arrayPancreaticCancer.reduce(0, +)
        print(sumPancreaticcancer)
        if (sumKidney == 0) {
            print("no chances")
            
        }
        if (sumKidney <= 3) {
            print("50% of chance")
            
        }
        if (sumKidney > 3) {
            print("high chances")
            result.text = "high chances of kidney disease"
            
        }
    }
  

}
