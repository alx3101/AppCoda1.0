//
//  RecentController.swift
//  AppCoda1.0
//
//  Created by alex popa on 05/01/22.
//

import UIKit

class RecentController: UIViewController {

    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
   }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func SUB(_ sender: Any) {
        
        let vc = BottomSlideMenuViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
}
