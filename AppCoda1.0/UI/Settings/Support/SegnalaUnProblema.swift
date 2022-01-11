//
//  SegnalaUnProblema.swift
//  AppCoda1.0
//
//  Created by alex popa on 08/01/22.
//

import UIKit

class SegnalaUnProblema: UIViewController {

    
    @IBOutlet var ViewReport: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       ViewReport.layer.cornerRadius = 25.0
        ViewReport.layer.shadowColor = UIColor.black.cgColor
        ViewReport.layer.shadowOffset = .zero
        ViewReport.layer.shadowOpacity = 0.6
        ViewReport.layer.shadowRadius = 30.0
        ViewReport.layer.shadowPath = UIBezierPath(rect: ViewReport.bounds).cgPath
        ViewReport.layer.shouldRasterize = true
        

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
