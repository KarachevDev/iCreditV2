//
//  Person.swift
//  iCreditV2
//
//  Created by Артур Карачев on 27.12.24..
//

import SwiftUI

struct Person: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var mockPeople: [Person] = [
    .init(name: "Art"),
    .init(name: "Fdf"),
    .init(name: "Ass"),
    .init(name: "Dsf"),
    .init(name: "Gkd"),
]
