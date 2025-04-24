//
//  ContentView.swift
//  LunchboxClient
//
//  Created by Ambrose Mbayi on 24/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            RootNavigationView()
        }
        .padding()
        .onAppear {
            Config.shared.printAllConfigProperties()
        }
    }
    
}

#Preview {
    ContentView()
}
