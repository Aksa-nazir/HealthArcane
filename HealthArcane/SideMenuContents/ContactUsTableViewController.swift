//
//  ContactUsTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 23/02/22.
//

import UIKit

class ContactUsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

   
   
    @IBAction func backPressed(_ sender: Any) {
        
        transitionTOHome()
    }
        func transitionTOHome() {
        let hometabViewcontroller = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.hometabViewController) as? hometabViewController
        
        self.view.window?.rootViewController = hometabViewcontroller
        self.view.window?.makeKeyAndVisible()
}
}
