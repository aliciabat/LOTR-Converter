//
//  ContentView.swift
//  LOTRConverter
//
//  Created by SEMEQ  on 30/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    var body: some View {
        ZStack {
            // bg image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                // pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                // currency exchange
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                // conversion
                HStack {
                    // left
                    VStack {
                        // currency
                        HStack {
                            // currency img
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            // currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        // text
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(15)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                    }
                    // equal
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    // riqht
                    VStack {
                        // currency
                        HStack {
                            // currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            // currency img
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        // text
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(15)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                Spacer()
                // info btn
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency, {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        })
        .onChange(of: rightCurrency, {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        })
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(startCurrency: $leftCurrency, convertCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}

