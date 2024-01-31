//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by SEMEQ  on 31/01/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    var body: some View {
        HStack {
            // left img
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            // exchange text
            Text(text)
            // right img
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silverpiece, text: "1 silver piece = 4 silver pennies", rightImage: .silverpenny)
}
