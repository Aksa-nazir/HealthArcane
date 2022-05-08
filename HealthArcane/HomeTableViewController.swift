//
//  HomeTableViewController.swift
//  HealthArcane
//
//  Created by aksa nazir on 16/02/22.
//

import UIKit
import SideMenu
import Firebase
import SwiftUI

class HomeTableViewController: UITableViewController {
   
    
    var sideMenuNC: SideMenuNavigationController!
    
    
    
    
    @IBOutlet weak var MentalHealth: UIButton!
    
    @IBOutlet weak var PhysicalHealth: UIButton!
    
    @IBOutlet weak var MedicalHistory: UIButton!
    @IBOutlet weak var slideShow: UIImageView!
    var imageNames = [ "a1","a2" , "a3", "a4","overweight", "6", "underweight"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MentalHealth.layer.cornerRadius = 18
        PhysicalHealth.layer.cornerRadius = 18
        MedicalHistory.layer.cornerRadius = 18
        MentalHealth.layer.borderWidth = 2
        MentalHealth.layer.borderColor = UIColor.lightGray.cgColor
        
        PhysicalHealth.layer.borderWidth = 2
        PhysicalHealth.layer.borderColor = UIColor.lightGray.cgColor
        
        MedicalHistory.layer.borderWidth = 2
        MedicalHistory.layer.borderColor = UIColor.lightGray.cgColor
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
            self.slideShow.image = UIImage(named: self.imageNames.randomElement()!) //Slideshow logic
        }
        timer.fire()
       
        sideMenuConfig()
    }
    
    
    @IBAction func logout(_ sender: Any) {
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
    
    
    @IBAction func sideMenu(_ sender: Any) {
       
        
        self.present(sideMenuNC, animated: true, completion: {
            
        })
        
        
    }
    func sideMenuConfig() {
        let sideMenuVC =  UIViewController()
        let newView = sideMenuVC.view
        newView!.backgroundColor = .lightGray

        
        sideMenuNC = .init(rootViewController: sideMenuVC)
        sideMenuNC?.leftSide = true
        sideMenuNC?.menuWidth = newView!.bounds.width * 0.7
        sideMenuNC.navigationBar.topItem?.title = "HealthArcane"
        sideMenuNC.navigationBar.backgroundColor = .systemBlue
        SideMenuManager.default.leftMenuNavigationController = sideMenuNC
        SideMenuManager.default.addPanGestureToPresent(toView: newView!)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view, forMenu: .left)
        
        let stackView   = UIStackView(frame: CGRect(x: 0, y: 100, width :  400, height: 900))
        
        
        
//        stackView.translatesAutoresizingMaskIntoConstraints = true

      

        
        
        
        newView?.addSubview(stackView)
        stackView.backgroundColor = .lightGray
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 20.0
        
        
        
        
        let DarkMode = UIButton(type: .custom)
        DarkMode.setTitle("   Dark Mode", for: UIControl.State())
        DarkMode.translatesAutoresizingMaskIntoConstraints = false
        DarkMode.layer.borderWidth = 2
        DarkMode.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        DarkMode.contentHorizontalAlignment = .left
        DarkMode.addTarget(self, action: #selector(Dark), for: .touchUpInside)
        DarkMode.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        stackView.addSubview(DarkMode)
        DarkMode.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 40).isActive = true
        DarkMode.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true

        
        let LightMode = UIButton(type: .custom)
        LightMode.setTitle("   Light Mode", for: UIControl.State())
        LightMode.translatesAutoresizingMaskIntoConstraints = false
        LightMode.layer.borderWidth = 2
        LightMode.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        LightMode.contentHorizontalAlignment = .left
        LightMode.addTarget(self, action: #selector(Light), for: .touchUpInside)
        LightMode.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        stackView.addSubview(LightMode)
        LightMode.topAnchor.constraint(equalTo: DarkMode.topAnchor, constant: 40).isActive = true
        LightMode.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        
        
        let ContactUs = UIButton(type: .custom)
        ContactUs.setTitle("   Contact Us", for: UIControl.State())
        ContactUs.translatesAutoresizingMaskIntoConstraints = false
        ContactUs.layer.borderWidth = 2
        ContactUs.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        ContactUs.contentHorizontalAlignment = .left
        ContactUs.addTarget(self, action: #selector(contact), for: .touchUpInside)
        ContactUs.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        stackView.addSubview(ContactUs)
        ContactUs.topAnchor.constraint(equalTo: LightMode.topAnchor, constant: 40).isActive = true
        ContactUs.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
       
        
        let PrivacyPolicy = UIButton(type: .custom)
        PrivacyPolicy.setTitle("   PrivacyPolicy", for: UIControl.State())
        PrivacyPolicy.translatesAutoresizingMaskIntoConstraints = false
        PrivacyPolicy.layer.borderWidth = 2
        PrivacyPolicy.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        PrivacyPolicy.contentHorizontalAlignment = .left
        PrivacyPolicy.addTarget(self, action: #selector(Privacy), for: .touchUpInside)
        PrivacyPolicy.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        stackView.addSubview(PrivacyPolicy)
        PrivacyPolicy.topAnchor.constraint(equalTo: ContactUs.topAnchor, constant: 40).isActive = true
        PrivacyPolicy.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true

     
      
        let Logout = UIButton(type: .custom)
        Logout.setTitle("   Logout", for: UIControl.State())
        Logout.translatesAutoresizingMaskIntoConstraints = false
        Logout.layer.borderWidth = 2
        Logout.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        Logout.contentHorizontalAlignment = .left
        Logout.addTarget(self, action: #selector(logoutbtn), for: .touchUpInside)
        Logout.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        stackView.addSubview(Logout)
        Logout.topAnchor.constraint(equalTo: PrivacyPolicy.topAnchor, constant: 40).isActive = true
        Logout.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
      
        
    }
    @objc func Dark() {
        view.backgroundColor = .black
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            appDelegate?.overrideUserInterfaceStyle = .dark
            print("hitiit")
            
        }
    }
    @objc func Light() {
        tableView.backgroundColor = .white
        navigationItem.titleView?.tintColor = UIColor(named: "color")
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            appDelegate?.overrideUserInterfaceStyle = .light
            
        }
    }
    @objc func Privacy() {
   print("helooo")
        
    }
    @objc func contact() {
     transitionToContacts()
        
        
    }
   
    @objc func logoutbtn() {
        try! Auth.auth().signOut()
        
        if self.storyboard != nil {
            transitionToLogin()
        }
        
    }
    public func transitionToContacts() {
        let contactTableViewcontroller = storyboard?.instantiateViewController(identifier: "contact") as? ContactUsTableViewController
        
        view.window?.rootViewController = contactTableViewcontroller
        view.window?.makeKeyAndVisible()
        
    }
   
}



