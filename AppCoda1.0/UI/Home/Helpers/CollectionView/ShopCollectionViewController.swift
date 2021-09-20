//
//  ShopCollectionViewController.swift
//  AppCoda1.0
//
//  Created by alex popa on 16/09/21.
//

import UIKit



class ShopCollectionViewController: UICollectionViewController {

    
    var ShopsSwift = [ShopStructure]()
  
    @IBOutlet weak var Delete: UIBarButtonItem!
    @IBOutlet weak var ShopCollectionView: UICollectionView!
    let ShopCollectionViewCellId = "ShopCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ShopCollectionViewCell")

        // Do any additional setup after loading the view.
        
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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ShopsSwift.count
    }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 3
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 127,height: 127)
        
    }

    
    
    override  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
