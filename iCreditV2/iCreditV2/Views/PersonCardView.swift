//
//  PersonCardView.swift
//  iCreditV2
//
//  Created by Артур Карачев on 27.12.24..
//

import SwiftUI

struct PersonCardView: View {
    var name: String
    var totalAmount: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.title)
                .fontWeight(.semibold)
                
            Text(totalAmount >= 0 ? "I borrow \(String(format: "%.2f", totalAmount))" : "I lend \(String(format: "%.2f", -totalAmount))")
            
                
        }
        .hSpacing(.leading)
        .padding()
        .frame(maxWidth: .infinity)
        .background(.background, in: .rect(cornerRadius: 10))
    }
}

#Preview {
    PeopleView()
}
