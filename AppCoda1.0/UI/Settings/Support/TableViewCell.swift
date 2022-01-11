//
//  TableViewCell.swift
//  AppCoda1.0
//
//  Created by alex popa on 08/01/22.
//

import UIKit
import Foundation

class TableViewCell: UITableViewCell {

    
     
    @IBOutlet private var nameLabel: UILabel!
    

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        
    }

    // MARK: Cell Configuration

    func configurateTheCell(_ SD: SD) {
        nameLabel.text = SD.name
        
    }

}
