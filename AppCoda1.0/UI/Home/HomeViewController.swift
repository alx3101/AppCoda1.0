//
//  HomeViewController.swift
//  AppCoda1.0
//
//  Created by alex popa on 30/07/21.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var ShopCollectionView: UICollectionView!
    let ShopCollectionViewCellId = "ShopCollectionViewCell"
    

    var ShopsSwift = [ShopStructure]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   /*     // Do any additional setup after loading the view, typically from a nib.
        
        
        ShopCollectionView.layer.cornerRadius = 10
        ShopCollectionView.layer.masksToBounds = true
        
        
        // register cell
        let nibCell = UINib(nibName: ShopCollectionViewCellId, bundle: nil)
        ShopCollectionView.register(nibCell, forCellWithReuseIdentifier: ShopCollectionViewCellId)
        ShopCollectionView.delegate = self
        ShopCollectionView.dataSource = self
        
        // init data
        for _ in 1...25 {
            let Shop = ShopStructure()
            Shop?.pp = "6"
            Shop?.loc = "G.marconi 65"
            ShopsSwift.append(Shop!)
        }
        ShopCollectionView.reloadData()
    } */
}

// Code for collectionview


/*
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ShopsSwift.count
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 3
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 127,height: 127)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCellId, for: indexPath) as! ShopCollectionViewCell
        let Shop = ShopsSwift[indexPath.row]
       
        cell.People.text = Shop.pp!
        cell.Location.text = Shop.loc!
        
        cell.addButtonTapAction = {
                   // implement your logic here, e.g. call preformSegue()
                   self.performSegue(withIdentifier: "DP", sender: self)
        }
        
        return cell

        
        
    }
        
        
    
    
   
    */
       
     



 



}
