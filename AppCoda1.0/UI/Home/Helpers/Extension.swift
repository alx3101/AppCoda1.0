//
//  Extension.swift
//  AppCoda1.0
//
//  Created by alex popa on 30/07/21.
//

import Foundation
import FirebaseFirestore

extension Firestore {

var cars: Query {
    return collection("products").whereField("category", isEqualTo: "Cars").order(by: "timestamp", descending: true)
}
}
