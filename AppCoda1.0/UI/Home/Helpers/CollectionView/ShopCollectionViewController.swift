//
//  ShopCollectionViewController.swift
//  AppCoda1.0
//
//  Created by alex popa on 16/09/21.
//

import UIKit
import CoreData
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase





class ShopCollectionViewController: UICollectionViewController {

    var ref : DatabaseReference?
    var ShopsSwift = [ShopStructure]()
    var Distance : String!
    var Logo : UIImage!
    var pp : String!
    var loc : String!
    var CurrentShop : ShopStructure?
    
   
    @IBOutlet weak var ShopCollectionView: UICollectionView!
    let ShopCollectionViewCellId = "ShopCollectionViewCell"
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
        navigationItem.leftBarButtonItem = editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        

        // Do any additional setup after loading the view.
        
        ShopCollectionView.layer.cornerRadius = 10
        ShopCollectionView.layer.masksToBounds = true
        

        
        
        // register cell
        let nibCell = UINib(nibName: ShopCollectionViewCellId, bundle: nil)
        ShopCollectionView.register(nibCell, forCellWithReuseIdentifier: ShopCollectionViewCellId)
        ShopCollectionView.delegate = self
        ShopCollectionView.dataSource = self
        
        
        // init data
        for _ in 1...11 {
            let Shop = ShopStructure()
            Shop?.pp = "4"
            /* Shop?.loc = "G.marconi 65" */
            Shop?.Distance = "Actual Pozition"
            Shop?.Logo =  #imageLiteral(resourceName: "logo_small")
            Shop?.loc = " Via G.marconi 65"
            
            
            ShopsSwift.append(Shop!)
        }
        ShopCollectionView.reloadData()
        
        for _ in 11...20 {
            let Shop = ShopStructure()
            Shop?.pp = "20"
            /* Shop?.loc = "Unieuro" */
            Shop?.Distance = "12 Km"
            Shop?.Logo = #imageLiteral(resourceName: "1200px-Unieuro_Logo_2015-3.png")
            Shop?.loc = " Via Le Centurie"
            ShopsSwift.append(Shop!)
        }
        ShopCollectionView.reloadData()
        
        for _ in 20...25 {
            let Shop = ShopStructure()
            Shop?.pp = "100"
            /* Shop?.loc = "Nave de vero" */
            Shop?.Distance = "49 Km"
            Shop?.Logo = #imageLiteral(resourceName: "Nave de Veri.png")
            Shop?.loc = "Via Pietro Arduino, 20, 30175 Venezia VE"
            ShopsSwift.append(Shop!)
        }
        ShopCollectionView.reloadData()
        
        
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
           super.setEditing(editing, animated: animated)
           
           collectionView.allowsMultipleSelection = editing
           let indexPaths = collectionView.indexPathsForVisibleItems
           for indexPath in indexPaths {
               let ShopCollectionViewCell = collectionView.cellForItem(at: indexPath) as! ShopCollectionViewCell
               ShopCollectionViewCell.isInEditingMode = editing
           }
       }
    
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
      
        /* cell.Location.text = Shop.loc! */
        cell.Distance.text = Shop.Distance!
        cell.Logo.image = Shop.Logo!
        cell.Location.text = Shop.loc!
        
        cell.isInEditingMode = isEditing
            return cell
    }

    // MARK: UICollectionViewDelegate

        // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            CurrentShop = ShopsSwift[indexPath.row]
            performSegue(withIdentifier: "DP", sender: ShopCollectionView)
        
    }

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let viewController = segue.destination as? DetailPage{
                viewController.Shop = CurrentShop
            }
        }
    
   
    }



