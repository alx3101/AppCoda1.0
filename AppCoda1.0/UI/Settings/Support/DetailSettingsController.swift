//
//  DetailSettingsController.swift
//  AppCoda1.0
//
//  Created by alex popa on 08/01/22.
//

import UIKit
import Foundation

class DetailSettingsController: UIViewController {

   
    @IBOutlet var nameLabel: UILabel!
  

    var SD: SD?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let SD = SD {
            nameLabel.text = SD.name
        }
    }
}
