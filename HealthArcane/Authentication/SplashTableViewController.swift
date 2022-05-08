//
//  SplashTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 21/02/22.
//

import UIKit
import FirebaseAuth

class SplashTableViewController: UITableViewController {

    @IBOutlet weak var tableCell: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableCell.backgroundColor = UIColor(patternImage: UIImage(named: "frontpic-1")!)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "frontpic-1")!)
        
        
    }
    

    
    
    
    
    @IBAction func next(_ sender: Any) {
        
        
        if Auth.auth().currentUser != nil {
        
            let hometabViewcontroller = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.hometabViewController) as? hometabViewController
            
            self.view.window?.rootViewController = hometabViewcontroller
            self.view.window?.makeKeyAndVisible()
            print("goodnight")
            
         
            
        } else {
            let logintabViewcontroller = storyboard?.instantiateViewController(identifier: "Login") as? LoginScreenTableViewController
            print("gooday")
            view.window?.rootViewController = logintabViewcontroller
             view.window?.makeKeyAndVisible()
         
            
        }
    }
        
        
        
        
        
        
        
        
    
    
    
}
