//
//  ContentView.swift
//  LOTRConverter
//
//  Created by SEMEQ  on 30/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
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
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            // currency text
                            Text("Silver piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        // text
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
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
                            Text("Gold piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            // currency img
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        // text
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
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
                    .sheet(isPresented: $showExchangeInfo, content: {
                        ExchangeInfo()
                    })
                }
            }
            //            .border(.blue)
        }
    }
}

#Preview {
    ContentView()
}

