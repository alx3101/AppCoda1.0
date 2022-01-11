//
//  ViewController.swift
//  AppCoda1.0
//
//  Created by alex popa on 13/07/21.
//

import UIKit
import FirebaseAuth
import Hero
import Firebase
import GoogleSignIn
import AuthenticationServices

class login: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet var SingIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        setUpElements()
        
        EmailTextField.layer.cornerRadius = 10.0
        EmailTextField.layer.shadowColor = UIColor.black.cgColor
        EmailTextField.layer.shadowOffset = .zero
        EmailTextField.layer.shadowOpacity = 0.4
        EmailTextField.layer.shadowRadius = 10.0
        EmailTextField.layer.shadowPath = UIBezierPath(rect: EmailTextField.bounds).cgPath
        EmailTextField.layer.shouldRasterize = true
        
        PasswordTextField.layer.cornerRadius = 10.0
        PasswordTextField.layer.shadowColor = UIColor.black.cgColor
        PasswordTextField.layer.shadowOffset = .zero
        PasswordTextField.layer.shadowOpacity = 0.4
        PasswordTextField.layer.shadowRadius = 10.0
        PasswordTextField.layer.shadowPath = UIBezierPath(rect: PasswordTextField.bounds).cgPath
        PasswordTextField.layer.shouldRasterize = true
        
        
        loginButton.layer.cornerRadius = 10.0
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = .zero
        loginButton.layer.shadowOpacity = 0.4
        loginButton.layer.shadowRadius = 10.0
        loginButton.layer.shadowPath = UIBezierPath(rect: loginButton.bounds).cgPath
        loginButton.layer.shouldRasterize = true
        
        SingIn.layer.cornerRadius = 10.0
        SingIn.layer.shadowColor = UIColor.black.cgColor
        SingIn.layer.shadowOffset = .zero
        SingIn.layer.shadowOpacity = 0.4
        SingIn.layer.shadowRadius = 10.0
        SingIn.layer.shadowPath = UIBezierPath(rect: SingIn.bounds).cgPath
        SingIn.layer.shouldRasterize = true
     
        
    }
    
    func setUpElements() {
        
        errorLabel.alpha = 0
    }
    
 
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        
        }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        
        
        if self.EmailTextField.text == "" || self.PasswordTextField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        
        } else {
            
            Auth.auth().signIn(withEmail: self.EmailTextField.text!, password: self.PasswordTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    
                    //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
            }
        }
    }
  
    
        }

