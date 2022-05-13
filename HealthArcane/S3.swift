//
//  S3.swift
//  HealthArcane
//
//  Created by aksa nazir on 08/05/22.
//

import UIKit

class S3: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func Q11YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(1)
    }
    @IBAction func Q11NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(1)
    }
    @IBAction func Q12YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayPancreaticCancer.append(1)
    }
    @IBAction func Q12NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayPancreaticCancer.append(-1)
    }
    @IBAction func Q13YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayPancreaticCancer.append(1)
    }
    @IBAction func Q13NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayPancreaticCancer.append(1)
    }
    @IBAction func Q14YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(1)
    }
    @IBAction func Q14NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(-1)
    }
    @IBAction func Q15YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayKidney.append(1)
    }
    @IBAction func Q15NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayKidney.append(-1)
    }
    @IBAction func next3(_ sender: Any) {
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
    }
}
