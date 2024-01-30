//
//  ContentView.swift
//  LOTRConverter
//
//  Created by SEMEQ  on 30/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            Text("Hello, world!")
                .fontWeight(.heavy)
                .foregroundColor(Color.pink)
            Button("Click") {}
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

