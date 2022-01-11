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
    @IBOutlet weak var DistanceBK: UIView!
    @IBOutlet weak var CL: UILabel!
    @IBOutlet weak var ColorPeople: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        ColorPeople.layer.cornerRadius = 10
        ColorPeople.layer.shadowColor = UIColor.black.cgColor
        ColorPeople.layer.shadowOffset = .zero
        ColorPeople.layer.shadowOpacity = 0.6
        ColorPeople.layer.shadowRadius = 30.0
        ColorPeople.layer.shadowPath = UIBezierPath(rect: ColorPeople.bounds).cgPath
        ColorPeople.layer.shouldRasterize = true
        
        DistanceBK.layer.cornerRadius = 10
        DistanceBK.layer.shadowColor = UIColor.black.cgColor
        DistanceBK.layer.shadowOffset = .zero
        DistanceBK.layer.shadowOpacity = 0.6
        DistanceBK.layer.shadowRadius = 30.0
        DistanceBK.layer.shadowPath = UIBezierPath(rect: DistanceBK.bounds).cgPath
        DistanceBK.layer.shouldRasterize = true
        
        
        

    }
    
    
    
    override func layoutSubviews() {
           // cell rounded section
           self.layer.cornerRadius = 15.0
           
       }
   
    
  
    
    var isInEditingMode: Bool = false {
        didSet {
            CL.isHidden = !isInEditingMode
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isInEditingMode {
                CL.text = isSelected ? "✓" : ""
            }
        }

        
    
    
      

}
}
