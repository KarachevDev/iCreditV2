//
//  Lending.swift
//  iCreditV2
//
//  Created by Артур Карачев on 27.12.24..
//

import SwiftUI

struct Lending {
    var id: String = UUID().uuidString
    var personId: String
    var description: String
    var amount: Double
    var currency: String
    var dateAdded: Date
    var ownType: String
    
    init(personId: String, description: String, amount: Double, currency: String, dateAdded: Date, ownType: OwnType) {
        self.personId = personId
        self.description = description
        self.amount = amount
        self.currency = currency
        self.dateAdded = dateAdded
        self.ownType = ownType.rawValue
    }
}
