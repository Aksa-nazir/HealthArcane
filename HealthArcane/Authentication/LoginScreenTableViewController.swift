//
//  FirstLoginScreenTableViewController.swift
//  Health Arcane
//
//  Created by aksa nazir on 16/01/22.
//

import UIKit
import FirebaseAuth




class LoginScreenTableViewController: UITableViewController {
   
    public func transitionTOHome() {
        let hometabViewcontroller = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.hometabViewController) as? hometabViewController
        
        self.view.window?.rootViewController = hometabViewcontroller
        self.view.window?.makeKeyAndVisible()
        
        
//        let hometabViewcontroller = storyboard?.instantiateViewController(identifier: "TabVc") as? hometabViewController
//
//       view.window?.rootViewController = hometabViewcontroller
//        view.window?.makeKeyAndVisible()

    }
   
    
    //Buttons
    var iconClick = true
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var goToSignup: UIButton!
    @IBOutlet weak var FbLogin: UIButton!
    @IBOutlet weak var GoogleLogin: UIButton!
    //Buttons
    
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    private var authUser : User? {
        return Auth.auth().currentUser
    }

    public func sendVerificationMail() {
        if self.authUser != nil && !self.authUser!.isEmailVerified {
            self.authUser!.sendEmailVerification(completion: { (error) in
                // Notify the user that the mail has sent or couldn't because of an error.
            })
        }
        else {
            // Either the user is not available, or the user is already verified.
        }
    }
    
    
    
    
    
    
    //text fields
    @IBOutlet weak var EmailiconTextField: UITextField! {
       didSet {
           EmailiconTextField.tintColor = UIColor.lightGray
           EmailiconTextField.setIcon(UIImage.init(named: "Mailicon")!)
           let redPlaceholderText = NSAttributedString(string: "Email",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
           
           EmailiconTextField.attributedPlaceholder = redPlaceholderText
       }
    }
    @IBOutlet weak var PasswordiconTextField: UITextField! {
       didSet {
           PasswordiconTextField.tintColor = UIColor.lightGray
           PasswordiconTextField.setIcon(UIImage.init(named: "Passwordicon")!)
           let redPlaceholderText = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
           
           PasswordiconTextField.attributedPlaceholder = redPlaceholderText
       }
    }
    
    
    //text fields
    override func viewDidLoad() {
       
        login.layer.cornerRadius = 15
        
        tableView.contentInsetAdjustmentBehavior = .never
        self.setupHideKeyboardOnTap()
        super.viewDidLoad()
  
      
        
    }
    /// Call this once to dismiss open keyboards by tapping anywhere in the view controller
     func setupHideKeyboardOnTap() {
         self.view.addGestureRecognizer(self.endEditingRecognizer())
         self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
     }

     /// Dismisses the keyboard from self.view
     private func endEditingRecognizer() -> UIGestureRecognizer {
         let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
         tap.cancelsTouchesInView = false
         return tap
     }
 
    @IBAction func loginBtn(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { (authResult, error) in
            if let authResult = authResult {
                let user = authResult.user
                print("User has Signed In")
                if user.isEmailVerified {
                    
                    self.transitionTOHome()
//
                } else {
                    // do whatever you want to do when user isn't verified
                }
            }
            if error != nil {
                print("Cant Sign in user")
            }
        
        }
        
    }
  
    @IBAction func SignupTapped(_ sender: Any) {
       transitionToSignUp()
    }
    
    
    @IBAction func fbLoginTapped(_ sender: Any) {
        
       
       
            
        }
   
    func transitionToSignUp() {
        let signUptabViewcontroller = self.storyboard?.instantiateViewController(identifier: "Signup") as? SignUpTableViewController

        self.view.window?.rootViewController = signUptabViewcontroller
        self.view.window?.makeKeyAndVisible()

    }
//
        
        
        
        
     
        
        
        
        
        
        
        
        
    
    
    
    @IBAction func gooogleLoginTapped(_ sender: Any) {
        
    }
    
    
    
    
    
    @IBAction func forgetButtonTapped(_ sender: Any) {
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
    
    
    
    
    
    
}
extension UITextField {
func setIcon(_ image: UIImage) {
    let iconView = UIImageView(frame:
                   CGRect(x: 10, y: 5, width: 20, height: 20))
    iconView.image = image
    let iconContainerView: UIView = UIView(frame:
                   CGRect(x: 20, y: 0, width: 30, height: 30))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
 
}
    
}














