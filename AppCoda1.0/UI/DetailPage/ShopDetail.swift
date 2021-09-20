//
//  ShopDetail.swift
//  AppCoda1.0
//
//  Created by alex popa on 29/07/21.
//

import Foundation
import FirebaseFirestore

struct ShopDetail {
    
    var logo: String
    var name: String
    var id: String
    var location : String
    var category: String
    var open: Bool
    var close: Bool
    var posizione : String
    var ActClients: String
    var LmtdClients: String
    
   
    
    init(data: [String: Any]) {
        self.id = data["id"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.category = data["category"] as? String ?? ""
        self.location = data["price"] as? String ?? ""
        self.open = data["Aperto"] as? Bool ?? true
        self.close = data["Chiuso"] as? Bool ?? false
        self.logo = data["imageUrl"] as? String ?? ""
        self.posizione = data["posizione"] as? String ?? ""
        self.ActClients = data["Persone attuali"] as? String ?? ""
        self.LmtdClients = data["Persone Limite"] as? String ?? ""
       
    }
    
    
}
