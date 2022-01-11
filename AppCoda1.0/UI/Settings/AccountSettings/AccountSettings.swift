//
//  AccountSettings.swift
//  AppCoda1.0
//
//  Created by alex popa on 23/07/21.
//

import UIKit

class AccountSettings: UIViewController {
    
    @IBOutlet var Email: UILabel!
    @IBOutlet var Logout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Email.layer.cornerRadius = 10.0
        Email.layer.shadowColor = UIColor.black.cgColor
        Email.layer.shadowOffset = .zero
        Email.layer.shadowOpacity = 0.1
        Email.layer.shadowRadius = 10
        Email.layer.shadowPath = UIBezierPath(rect: Email.bounds).cgPath
        Email.layer.shouldRasterize = true
        
        
        Logout.layer.cornerRadius = 10.0
        Logout.layer.shadowColor = UIColor.black.cgColor
        Logout.layer.shadowOffset = .zero
        Logout.layer.shadowOpacity = 0.1
        Logout.layer.shadowRadius = 10
        Logout.layer.shadowPath = UIBezierPath(rect: Logout.bounds).cgPath
        Logout.layer.shouldRasterize = true
        
       
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)

      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
