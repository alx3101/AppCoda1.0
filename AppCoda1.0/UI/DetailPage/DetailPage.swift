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
import CoreLocation
import MapKit
import ProgressMeter

class DetailPage: UIViewController, CLLocationManagerDelegate , MKMapViewDelegate {
   
    @IBOutlet var Logo: UIImageView!
    @IBOutlet var Via: UILabel!
    @IBOutlet var Distanzq: UILabel!
    @IBOutlet weak var ShopMap: MKMapView!
    @IBOutlet weak var Favorite: UIButton!
    @IBOutlet weak var PersoneAttuali: UILabel!
    @IBOutlet weak var LogoBK: UIView!
    @IBOutlet weak var WebSite: UIButton!
    @IBOutlet weak var Share: UIButton!
    @IBOutlet weak var DriveToShop: UIButton!
    @IBOutlet weak var Info: UIButton!
    @IBOutlet var ViaView: UIView!
    @IBOutlet var InfoBack: UIView!
    
    
    
    
    
    @IBOutlet var progressControl: ProgressMeter!
    
    var db: Firestore!
    var firebase: NSObjectProtocol?
    var listener: ListenerRegistration!
    var shops = [ShopDetail]()
    var Pp: Int = 1
    var Shop : ShopStructure?
    
    //User Position
    var managerPosizione: CLLocationManager!
    var posizioneUtente: CLLocationCoordinate2D!
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        db = Firestore.firestore()
        

        self.ShopMap.delegate = self
           self.managerPosizione = CLLocationManager()
        managerPosizione.delegate = self
            managerPosizione.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            managerPosizione.requestWhenInUseAuthorization()
            managerPosizione.startUpdatingLocation()
        
        if let CS = Shop {
            Distanzq.text = CS.Distance
            PersoneAttuali.text = CS.pp
            Logo.image = CS.Logo
            Via.text = CS.loc
            WebSite.userActivity?.webpageURL = CS.URL
              }
        
        //ItemView
        
        ViaView.layer.cornerRadius = 10.0
        ViaView.layer.shadowColor = UIColor.black.cgColor
        ViaView.layer.shadowOffset = .zero
        ViaView.layer.shadowOpacity = 0.1
        ViaView.layer.shadowRadius = 10.0
        ViaView.layer.shadowPath = UIBezierPath(rect: ViaView.bounds).cgPath
        ViaView.layer.shouldRasterize = true
        
        
        DriveToShop.layer.cornerRadius = 8.0
        DriveToShop.layer.shadowColor = UIColor.black.cgColor
        DriveToShop.layer.shadowOffset = .zero
        DriveToShop.layer.shadowOpacity = 0.1
        DriveToShop.layer.shadowRadius = 10.0
        DriveToShop.layer.shadowPath = UIBezierPath(rect: DriveToShop.bounds).cgPath
        DriveToShop.layer.shouldRasterize = true
        
        
        Info.layer.cornerRadius = 10.0
        Info.layer.shadowColor = UIColor.black.cgColor
        Info.layer.shadowOffset = .zero
        Info.layer.shadowOpacity = 0.1
        Info.layer.shadowRadius = 10.0
        Info.layer.shadowPath = UIBezierPath(rect: Info.bounds).cgPath
        Info.layer.shouldRasterize = true
        
        
        Share.layer.cornerRadius = 10.0
        Share.layer.shadowColor = UIColor.black.cgColor
        Share.layer.shadowOffset = .zero
        Share.layer.shadowOpacity = 0.1
        Share.layer.shadowRadius = 10.0
        Share.layer.shadowPath = UIBezierPath(rect: Share.bounds).cgPath
        Share.layer.shouldRasterize = true
        
        Favorite.layer.cornerRadius = 10.0
        Favorite.layer.shadowColor = UIColor.black.cgColor
        Favorite.layer.shadowOffset = .zero
        Favorite.layer.shadowOpacity = 0.1
        Favorite.layer.shadowRadius = 10.0
        Favorite.layer.shadowPath = UIBezierPath(rect: Favorite.bounds).cgPath
        Favorite.layer.shouldRasterize = true
        
        WebSite.layer.cornerRadius = 10.0
        WebSite.layer.shadowColor = UIColor.black.cgColor
        WebSite.layer.shadowOffset = .zero
        WebSite.layer.shadowOpacity = 0.1
        WebSite.layer.shadowRadius = 10.0
        WebSite.layer.shadowPath = UIBezierPath(rect: WebSite.bounds).cgPath
        WebSite.layer.shouldRasterize = true
     
     
        LogoBK.layer.cornerRadius = 10.0
        LogoBK.layer.shadowColor = UIColor.black.cgColor
        LogoBK.layer.shadowOffset = .zero
        LogoBK.layer.shadowOpacity = 0.1
        LogoBK.layer.shadowRadius = 10.0
        LogoBK.layer.shadowPath = UIBezierPath(rect: LogoBK.bounds).cgPath
        LogoBK.layer.shouldRasterize = true
        
        Distanzq.layer.cornerRadius = 15.0
        Distanzq.layer.shadowColor = UIColor.black.cgColor
        Distanzq.layer.shadowOffset = .zero
        Distanzq.layer.shadowOpacity = 0.1
        Distanzq.layer.shadowRadius = 10.0
        Distanzq.layer.shadowPath = UIBezierPath(rect: Logo.bounds).cgPath
        Distanzq.layer.shouldRasterize = true
        
        InfoBack.layer.cornerRadius = 10.0
        InfoBack.layer.shadowColor = UIColor.black.cgColor
        InfoBack.layer.shadowOffset = .zero
        InfoBack.layer.shadowOpacity = 0.1
        InfoBack.layer.shadowRadius = 10.0
        InfoBack.layer.shadowPath = UIBezierPath(rect: InfoBack.bounds).cgPath
        InfoBack.layer.shouldRasterize = true
        
        
    }
    
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        self.posizioneUtente = userLocation.coordinate // recupero la posizione dell'utente
        
        print("posizione aggiornata - lat: \(userLocation.coordinate.latitude) long: \(userLocation.coordinate.longitude)")
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // Creo un'area che sarà quella visualizzata dalla mappa
        
        let region = MKCoordinateRegion(center: posizioneUtente, span: span) // setto la regione, cioè l'area da visualizzare, nella posizione dell'utente e di dimensioni uguali allo span creato sopra
        
        mapView.setRegion(region, animated: true) // aggiorno la mappa facendogli visualizzare la regione calcolata
    }
    
    @IBAction func GoToWeb(_ sender: UIButton) {
        
       
            UIApplication.shared.openURL(NSURL(string: "www.google.it")! as URL)
    }
    @IBAction func TestVar(_ sender: Any) {
        
       
        
    }
    
    @IBAction func favoriteBack(_ sender: UIButton) {
        let generator = UINotificationFeedbackGenerator()
               generator.notificationOccurred(.success)
        if let button : UIButton = sender as? UIButton
        {
               button.isSelected = !button.isSelected

               if (button.isSelected)
               {
                   button.tintColor = UIColor.black
                   button.backgroundColor = #colorLiteral(red: 0.4440000057, green: 0.4440000057, blue: 0.4440000057, alpha: 1)
               }
               else
               {
                  
                   button.tintColor = UIColor.yellow
                   button.backgroundColor = UIColor.systemYellow
               }
           }
       }
    @IBAction func WebSelected(_ sender: UIButton) {
       

}
}
