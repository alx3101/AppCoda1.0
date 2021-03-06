//
//  SettingsViewController.swift
//  AppCoda1.0
//
//  Created by alex popa on 23/07/21.
//

import UIKit
import XLActionController

class SettingsViewController: UIViewController  {

   
    @IBOutlet var AccountSettings: UIButton!
    @IBOutlet var AppSettings: UIButton!
    @IBOutlet var BecomePartner: UIButton!
    @IBOutlet var AboutUs: UIButton!
    @IBOutlet var CS: UIButton!
    
    var AboutSheet : UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AccountSettings.layer.cornerRadius = 15.0
        AccountSettings.layer.shadowColor = UIColor.black.cgColor
        
        BecomePartner.layer.cornerRadius = 15.0
        BecomePartner.layer.shadowColor = UIColor.black.cgColor
        
        AboutUs.layer.cornerRadius = 15.0
        AboutUs.layer.shadowColor = UIColor.black.cgColor
        
        CS.layer.cornerRadius = 15.0
        CS.layer.shadowColor = UIColor.black.cgColor
        
       
    }
    
   
    
    @IBAction func AboutUS(_ sender: UIButton) {
        showActionSheet()
       
        
          
               
    }
    func showAlert() {
        let alert = UIAlertController(title: "Visit us on", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:  {
            action in
        }))
        present(alert, animated: true)
    }
    
    func showActionSheet() {
        
        let sheet = UIAlertController()
        sheet.addAction(UIAlertAction(title: "Instagram", style: .default, handler:  {
            action in
            UIApplication.shared.openURL(NSURL(string: "https://instagram.com/apdevelopment01?utm_medium=copy_link")! as URL)
        }))
        sheet.addAction(UIAlertAction(title: "Facebook", style: .default, handler:  {
            action in
        }))
        sheet.addAction(UIAlertAction(title: "Web", style: .default, handler:  {
            action in
            UIApplication.shared.openURL(NSURL(string: "https://instagram.com/apdevelopment01?utm_medium=copy_link")! as URL)
        }))
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:  {
            action in
        }))
        present(sheet, animated: true)
        
    }

   
  
}
