//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by SEMEQ  on 31/01/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var startCurrency: Currency
    @Binding var convertCurrency: Currency
    
    var body: some View {
        ZStack {
            // bg img
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                // text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                // currency icon
                IconGrid(selectedCurrency: $startCurrency)
                // text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                // currency icon
                IconGrid(selectedCurrency: $convertCurrency)
                // done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(startCurrency: .constant(.copperPenny), convertCurrency: .constant(.silverPiece))
}
