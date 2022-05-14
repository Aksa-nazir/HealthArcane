//
//  survey3ViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 18/04/22.
//

import UIKit
var fatty = ""
var kidney = ""
var heart = ""
var diabetes = ""
var pancreatic = ""
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
//        print(sumKidney)
        sumHeart = arrayHeart.reduce(0, +)
//        print(sumHeart)
        sumDiabetes = arrayDiabetes.reduce(0, +)
//        print(sumDiabetes)
        sumFattyliver = arrayfattyLiver.reduce(0, +)
//        print(sumFattyliver)
        sumPancreaticcancer = arrayPancreaticCancer.reduce(0, +)
//        print(sumPancreaticcancer)
       
        if (sumKidney <= 0) {
            kidney = "1. No chances of kidney disease  "
//            print("no chances of kidney disease")
            
        }
        if (sumKidney > 0 && sumKidney <= 3) {
//            print("50% of chance of kidney disease")
            kidney = "1. 50% of chances of kidney disease  "
        }
        if (sumKidney > 3 ) {
//            print("high chances of kidney disease")
            kidney = "1. High chances of kidney disease  "
//            result.text = "high chances of kidney disease"
            
        }
        
        if (sumHeart <= 0) {
            heart = "2. No chances of heart disease  "
//            print("no chances of heart disease")
            
        }
        if (sumHeart > 0 && sumHeart <= 3) {
            heart = "2. 50% of chance of heart disease  "
//            print("50% of chance of heart disease")
            
        }
        if (sumHeart > 3 ) {
            heart = "2. high chances of heart disease  "
//            print("high chances of heart disease")
//            result.text = "high chances of heart disease"
            
        }
        if (sumDiabetes <= 0) {
            diabetes = "3. No chances of diabetes  "
//            print("no chances of diabetes")
            
        }
        if (sumDiabetes > 0 && sumDiabetes <= 3) {
            diabetes = "3. 50% of chance of diabetes  "
//            print("50% of chance of diabetes")
            
        }
        if (sumDiabetes > 3 ) {
            diabetes = "3. High chances of Diabetes  "
//            print("high chances of Diabetes")
            
//            result.text = "high chances of Diabetes disease"
            
        }
        if (sumFattyliver <= 0) {
            fatty = "4. No chances of Fattyliver  "
//            print("no chances of Fattyliver")
            
        }
        if (sumFattyliver > 0 && sumFattyliver <= 2) {
            fatty = "4. 50% of chance of Fattyliver  "
//            print("50% of chance of Fattyliver")
            
        }
        if (sumFattyliver > 3 ) {
//            print("high chances of Fattyliver")
            fatty = "4. High chances of Fattyliver  "
//            result.text = "high chances of Fattyliver disease"
            
        }
        if (sumPancreaticcancer <= 0) {
            pancreatic = "5. No chances of Pancreaticcancer  "
//            print("no chances of Pancreaticcancer")
            
        }
        if (sumPancreaticcancer > 0 && sumPancreaticcancer <= 4) {
            pancreatic = "5. 50% of chance of Pancreaticcancer  "
//            print("50% of chance of Pancreaticcancer")
            
        }
        if (sumPancreaticcancer > 4 ) {
            pancreatic = "5. High chances Pancreaticcancer  "
//            print("high chances Pancreaticcancer")
//            result.text =  "high chances of Pancreaticcancer disease"
            
        
        
        }
        let alertController = UIAlertController(title: "Result", message: nil , preferredStyle: .alert)
            alertController.message = "Time to wake up you have: \(heart + kidney + fatty + diabetes + pancreatic )"
            // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                NSLog("OK Pressed")
            }
       

            // Add the actions
            alertController.addAction(okAction)
            

            // Present the controller
        self.present(alertController, animated: true, completion: nil)
        
        
        
        
    }
  

}
