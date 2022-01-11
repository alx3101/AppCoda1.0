//
//  SingIn.swift
//  AppCoda1.0
//
//  Created by alex popa on 06/01/22.
//

import UIKit
import FirebaseAuth

class SingIn: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var Complete: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.cornerRadius = 15.0
        emailTextField.layer.shadowColor = UIColor.black.cgColor
        emailTextField.layer.shadowOffset = .zero
        emailTextField.layer.shadowOpacity = 0.6
        emailTextField.layer.shadowRadius = 30.0
        emailTextField.layer.shadowPath = UIBezierPath(rect: emailTextField.bounds).cgPath
        emailTextField.layer.shouldRasterize = true
        
        passwordTextField.layer.cornerRadius = 15.0
        passwordTextField.layer.shadowColor = UIColor.black.cgColor
        passwordTextField.layer.shadowOffset = .zero
        passwordTextField.layer.shadowOpacity = 0.6
        passwordTextField.layer.shadowRadius = 30.0
        passwordTextField.layer.shadowPath = UIBezierPath(rect: passwordTextField.bounds).cgPath
        passwordTextField.layer.shouldRasterize = true
        
        Complete.layer.cornerRadius = 15.0
        Complete.layer.shadowColor = UIColor.black.cgColor
        Complete.layer.shadowOffset = .zero
        Complete.layer.shadowOpacity = 0.6
        Complete.layer.shadowRadius = 30.0
        Complete.layer.shadowPath = UIBezierPath(rect: Complete.bounds).cgPath
        Complete.layer.shouldRasterize = true
        
        
       
    }
    
    @IBAction func createAccountAction(_ sender: AnyObject) {
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
}

