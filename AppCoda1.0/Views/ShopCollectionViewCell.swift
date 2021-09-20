//
//  ShopCollectionViewCell.swift
//  AppCoda1.0
//
//  Created by alex popa on 11/08/21.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var People: UILabel!
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var Distance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
           // cell rounded section
           self.layer.cornerRadius = 15.0
           
       }
    @IBAction func TDP(_ sender: Any) {
        addButtonTapAction?()
    }
    
    var addButtonTapAction : (()->())?
    

}
