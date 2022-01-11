//
//  TableCellSource.swift
//  AppCoda1.0
//
//  Created by alex popa on 08/01/22.
//

import Foundation

struct SD {
    let name: String
    
}

extension SD {
    static func createSDs() -> [SD] {
               //Login
        return [SD(name: "Non riesco ad accedere"),
                SD(name: "Non riesco ad accedere con Apple ID"),
                SD(name: "Non riesco ad accedere con Google"),
                SD(name: "Reset Password non funziona"),
                 //Sing In
                SD(name: "Non riesco ad effettuare la registrazione"),
                SD(name: "L'account è gia esistente"),
                SD(name: "Account creato ma non effettuato l'accesso"),
                 //Home
                SD(name: "Non carica la home"),
                SD(name: "I negozi non vengono salvati"),
                SD(name: "Non si aggiornano i negozi"),
                //Recenti
                SD(name: "Japanese Noodle with Pork"),
                SD(name: "Green Tea"),
                SD(name: "Thai Shrimp Cake"),
                //Search
                SD(name: "Angry Birds Cake"),
                SD(name: "Angry Birds Cake"),
                SD(name: "Ham and Cheese Panini")]
    }
}
