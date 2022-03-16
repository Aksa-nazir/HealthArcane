//
//  WeighCalculatorTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 16/03/22.
//

import UIKit

class WeighCalculatorTableViewController: UITableViewController {

    @IBOutlet weak var tableCell: UITableViewCell!
    @IBOutlet weak var WeightLbl: UILabel!
   
    
    
    @IBOutlet weak var Weight: UITextField!
    
    @IBOutlet weak var heightLbl: UILabel!
    
    @IBOutlet weak var Height: UITextField!
    
    
    @IBOutlet weak var LabelResult: UILabel!
    var imc: Double = 0
   
    
    
   
    @IBOutlet weak var weightxt: UITextField! {
        didSet {
            weightxt.tintColor = UIColor.black
            let redPlaceholderText = NSAttributedString(string: "weight in Kg",attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            
            weightxt.attributedPlaceholder = redPlaceholderText
            

        
        }
    }
    
    
    @IBOutlet weak var heighttxt: UITextField! {
        didSet {
            heighttxt.tintColor = UIColor.black
            
            let redPlaceholderText = NSAttributedString(string: "Height in meters",attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            
            heighttxt.attributedPlaceholder = redPlaceholderText
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        self.tableCell.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
    }
    
    
  
    
    
    
    
    

    @IBAction func Calculate(_ sender: Any) {
        
        guard let weight = Double(Weight.text!), let height = Double(Height.text!) else {return}
              imc = weight / (height * height)

       
        
       showResults()
}
    func showResults(){
           var result: String = " "
          
           
           switch imc {
               case 0..<16:
                   result = "Severe Thinness"
                  
               case 16..<17:
                   result = "Moderate Thinness"
                 
           case 17..<18.5:
                   result = "Mild Thinness"
                 
           case 18.5..<25:
                   result = "Normal"
           case 25..<30:
               result = "Overweight"
           case 30..<35:
               result = "Obese Class I"
           case 35..<40:
               result = "Obese Class II"
           
               default:
                   result = "Obese Class III"
                 
           }
        LabelResult.text = "\(Int(imc)): \(result)"
    }
}
