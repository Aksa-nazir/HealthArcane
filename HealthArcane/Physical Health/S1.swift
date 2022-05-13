//
//  ViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 12/04/22.
//

import UIKit
var sumKidney: Int = Int()
var sumHeart: Int = Int()
var sumFattyliver: Int = Int()
var sumDiabetes: Int = Int()
var sumPancreaticcancer: Int = Int()
var arrayKidney = [0]
var arrayHeart = [0]
var arrayDiabetes = [0]
var arrayfattyLiver = [0]
var arrayPancreaticCancer = [0]
class S1: UITableViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Q1YES(_ sender: Any) {
        arrayKidney.append(1)
        
        (sender as? UIButton)?.isEnabled = false
    }
    
    @IBAction func Q1NO(_ sender: Any) {
        arrayKidney.append(-1)
        (sender as? UIButton)?.isEnabled = false
    }
    @IBAction func Q2YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(1)
    }
    @IBAction func Q2NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayDiabetes.append(-1)
    }
    @IBAction func Q3YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayKidney.append(1)
        arrayHeart.append(1)
        arrayPancreaticCancer.append(1)
    }
    @IBAction func Q3NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayKidney.append(-1)
        arrayHeart.append(-1)
        arrayPancreaticCancer.append(-1)
        
    }
    @IBAction func Q4YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayHeart.append(1)
    }
    @IBAction func Q4NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayHeart.append(-1)
        
    }
    @IBAction func Q5YES(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayfattyLiver.append(1)
        arrayPancreaticCancer.append(1)
    }
    @IBAction func Q5NO(_ sender: Any) {
        (sender as? UIButton)?.isEnabled = false
        arrayfattyLiver.append(-1)
        arrayPancreaticCancer.append(-1)
    }
    @IBAction func NEXT1(_ sender: Any) {

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

