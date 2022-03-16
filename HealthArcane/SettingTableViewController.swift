//
//  SettingTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 22/02/22.
//

import UIKit
import FirebaseAuth

class SettingTableViewController: UITableViewController {

    
    @IBOutlet weak var DarkMode: UIButton!
    
    @IBOutlet weak var LightMode: UIButton!
    @IBOutlet weak var PrivacyPolicy: UIButton!
    @IBOutlet weak var ChangePassword: UIButton!
    @IBOutlet weak var Logout: UIButton!
    
    @IBOutlet weak var tableCell: UITableViewCell!
    
    
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        self.tableCell.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        DarkMode.layer.cornerRadius = 10
        LightMode.layer.cornerRadius = 10
        PrivacyPolicy.layer.cornerRadius = 10
        ChangePassword.layer.cornerRadius = 10
        Logout.layer.cornerRadius = 10
    }
    
    
    @IBAction func DarkModeTapped(_ sender: Any) {
        view.backgroundColor = .black
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            appDelegate?.overrideUserInterfaceStyle = .dark
            print("hitiit")
            
        }
    }
    
    
    @IBAction func LightModeTapped(_ sender: Any) {
       
        tableView.backgroundColor = .white
        
        
        
        navigationItem.titleView?.tintColor = UIColor(named: "color")
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            appDelegate?.overrideUserInterfaceStyle = .light
            
        }
    }
    
    
    @IBAction func PrivacyPolicyTapped(_ sender: Any) {
        
    }
    

    @IBAction func ChangePsswordTapped(_ sender: Any) {
        let forgotPasswordAlert = UIAlertController(title: "Forgot password?", message: "Enter email address", preferredStyle: .alert)
          forgotPasswordAlert.addTextField { (textField) in
              textField.placeholder = "Enter email address"
          }
          forgotPasswordAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
          forgotPasswordAlert.addAction(UIAlertAction(title: "Reset Password", style: .default, handler: { (action) in
              let resetEmail = forgotPasswordAlert.textFields?.first?.text
              Auth.auth().sendPasswordReset(withEmail: resetEmail!, completion: { (error) in
                  if error != nil{
                      let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: \(String(describing: error?.localizedDescription))", preferredStyle: .alert)
                      resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                      self.present(resetFailedAlert, animated: true, completion: nil)
                  }else {
                      let resetEmailSentAlert = UIAlertController(title: "Reset email sent successfully", message: "Check your email", preferredStyle: .alert)
                      resetEmailSentAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                      self.present(resetEmailSentAlert, animated: true, completion: nil)
                  }
              })
          }))
          //PRESENT ALERT
          self.present(forgotPasswordAlert, animated: true, completion: nil)
      
    }
    
    @IBAction func LogoutTapped(_ sender: Any) {
        try! Auth.auth().signOut()
        
        if self.storyboard != nil {
            transitionToLogin()
        }
    }
    public func transitionToLogin() {
        let logintabViewcontroller = storyboard?.instantiateViewController(identifier: "Login") as? LoginScreenTableViewController
        
        view.window?.rootViewController = logintabViewcontroller
        view.window?.makeKeyAndVisible()
        
    }
    
    
}
