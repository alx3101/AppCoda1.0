//
//  DetailPage.swift
//  AppCoda1.0
//
//  Created by alex popa on 28/07/21.
//

import UIKit
import Alamofire
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore

class DetailPage: UIViewController {
   
    @IBOutlet var Logo: UIImageView!
    @IBOutlet var Via: UILabel!
    @IBOutlet var Distanzq: UIButton!
    
    var db: Firestore!
    var firebase: NSObjectProtocol?
    var listener: ListenerRegistration!
    var shops = [ShopDetail]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        

        // Do any additional setup after loading the view.
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
