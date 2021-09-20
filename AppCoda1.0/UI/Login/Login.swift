//
//  ViewController.swift
//  AppCoda1.0
//
//  Created by alex popa on 13/07/21.
//

import UIKit
import FirebaseAuth
import Hero

class login: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpElements()
        
        EmailTextField.layer.cornerRadius = 15.0
        EmailTextField.layer.shadowColor = UIColor.black.cgColor
        EmailTextField.layer.shadowOffset = .zero
        EmailTextField.layer.shadowOpacity = 0.4
        EmailTextField.layer.shadowRadius = 10.0
        EmailTextField.layer.shadowPath = UIBezierPath(rect: EmailTextField.bounds).cgPath
        EmailTextField.layer.shouldRasterize = true
        
        PasswordTextField.layer.cornerRadius = 15.0
        PasswordTextField.layer.shadowColor = UIColor.black.cgColor
        PasswordTextField.layer.shadowOffset = .zero
        PasswordTextField.layer.shadowOpacity = 0.4
        PasswordTextField.layer.shadowRadius = 10.0
        PasswordTextField.layer.shadowPath = UIBezierPath(rect: PasswordTextField.bounds).cgPath
        PasswordTextField.layer.shouldRasterize = true
        
        
    }
    
    func setUpElements() {
        
        errorLabel.alpha = 0
    }
    
   /* @objc override func onTap() {
      let vc2 = BuiltInTransitionExampleViewController2()

      // this enables Hero
      vc2.hero.isEnabled = true

      // this configures the built in animation
      //    vc2.hero.modalAnimationType = .zoom
      //    vc2.hero.modalAnimationType = .pageIn(direction: .left)
      //    vc2.hero.modalAnimationType = .pull(direction: .left)
      //    vc2.hero.modalAnimationType = .autoReverse(presenting: .pageIn(direction: .left))
      vc2.hero.modalAnimationType = .selectBy(presenting: .pull(direction: .left), dismissing: .slide(direction: .down))

      // lastly, present the view controller like normal
      present(vc2, animated: true, completion: nil)
    }
  */

        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        
        }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        
        
        let ema = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: ema, password: pass) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                
                let TabNavigation = self.storyboard?.instantiateViewController(identifier: Costants.Storyboard.TabNavigation) as? TabNavigation
                
                self.view.window?.rootViewController = TabNavigation
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
   
    
        }

