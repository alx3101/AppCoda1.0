//
//  SegnalaProblema.swift
//  AppCoda1.0
//
//  Created by alex popa on 08/01/22.
//

import UIKit

class SegnalaProblema: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    var AboutSheet : UIAlertController!

    /*func showAlert() {
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
        
    }*/

}
