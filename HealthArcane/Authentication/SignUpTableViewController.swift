//
//  FirstSignUpTableViewController.swift
//  Health Arcane
//
//  Created by aksa nazir on 16/01/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
class SignUpTableViewController: UITableViewController {

    var ref: DatabaseReference!
    
    private let storage = Storage.storage().reference()
    @IBOutlet weak var signUp: UIButton!
    
    
    @IBOutlet weak var AlreadyAUser: UIButton!
    
    @IBOutlet weak var name: UITextField!
    
    
    @IBOutlet weak var Email: UITextField!
    
    
    @IBOutlet weak var Number: UITextField!
    
    
    
    @IBOutlet weak var Password: UITextField!
    
    
    @IBOutlet weak var confirmPassword: UITextField!
    
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


    override func viewDidLoad() {
//        navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewDidLoad()
        ref = Database.database().reference().child("users")
    }
   
    func validateFields() -> String? {
        
        // Check that all fields are filled in
            if  name.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
                Email.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
                Number.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
                Password.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" ||
                confirmPassword.text?.trimmingCharacters(in:.whitespacesAndNewlines) == ""
        {
            
            return "Please fill in all fields."
        }
        
        return nil
        
    }

    @IBOutlet weak var NameField: UITextField! {
        didSet {
            let redPlaceholderText = NSAttributedString(string: "Full Name",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            NameField.attributedPlaceholder = redPlaceholderText
        }
    }
    @IBOutlet weak var EmailField: UITextField! {
        didSet {
            let redPlaceholderText = NSAttributedString(string: "Email",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            EmailField.attributedPlaceholder = redPlaceholderText
        }
    }
    @IBOutlet weak var NumberField: UITextField! {
        didSet {
            let redPlaceholderText = NSAttributedString(string: "Mobile Number",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            NumberField.attributedPlaceholder = redPlaceholderText
        }
    }
    @IBOutlet weak var PasswordField: UITextField! {
        didSet {
            let redPlaceholderText = NSAttributedString(string: "Password",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            PasswordField.attributedPlaceholder = redPlaceholderText
        }
    }
    @IBOutlet weak var ConfirmPasswordField: UITextField! {
        didSet {
            let redPlaceholderText = NSAttributedString(string: "Confirm Password",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            
            ConfirmPasswordField.attributedPlaceholder = redPlaceholderText
        }
    }
    @IBAction func SignUpBtn(_ sender: Any) {
        let error = validateFields()
              if error != nil {
                  // There's something wrong with the fields, show error message
//                 showError(error!)
                  
                  let alert = UIAlertController(title: "fill all the feilds", message: "", preferredStyle: .alert)
                     alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                     self.present(alert, animated: true, completion: nil)
                 
              }
               else  {
                  // Create cleaned versions of the data
                  let name = name.text!.trimmingCharacters(in:.whitespacesAndNewlines)
                  let email = Email.text!.trimmingCharacters(in:.whitespacesAndNewlines)
                  let Number = Number.text!.trimmingCharacters(in:.whitespacesAndNewlines)
                  

        
        let alert = UIAlertController(title: "Account Created", message: "Please verify your Email and Login again.", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

           self.present(alert, animated: true, completion: nil)


           if let Email = Email.text, let Password = Password.text {

               Auth.auth().createUser(withEmail: Email, password: Password, completion: { user, error in
                   
                   
                   
                   let userid = Auth.auth().currentUser?.uid

                   let USER = ["id":userid, "name": name, "email": email, "number": Number]
                 
                                              //adding the artist inside the generated unique key
                   self.ref.child(userid!).setValue(USER)
              
                   
                   
                   
                   
                   
                   
                   
                   
                   if let firebaseError = error {
                       print(firebaseError.localizedDescription)
                       return
                   }
               

                   self.sendVerificationMail()
                   
                   let tabViewcontroller = self.storyboard?.instantiateViewController(identifier: "Login") as? LoginScreenTableViewController
                   
                   self.view.window?.rootViewController = tabViewcontroller
                   self.view.window?.makeKeyAndVisible()
                   
                   
                   
                   

               })
           }
               }
        
        
    }
    
    @IBAction func HaveAnAccount(_ sender: Any) {
        transitionToLogin()

    }
    func transitionToLogin() {
        let logintabViewcontroller = self.storyboard?.instantiateViewController(identifier: "Login") as? LoginScreenTableViewController

        self.view.window?.rootViewController = logintabViewcontroller
        self.view.window?.makeKeyAndVisible()

    }
   
    
}
