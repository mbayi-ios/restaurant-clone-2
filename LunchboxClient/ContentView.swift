//
//  ContentView.swift
//  LunchboxClient
//
//  Created by Ambrose Mbayi on 24/04/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("didShowWalkthrough", store: .standard) var didShowWalkthrough = false
    
    @State private var didShowSplash = true
    
    private var isOnboardingPresented: Binding<Bool> {
        Binding {
            !didShowWalkthrough
        } set: { value in
            didShowWalkthrough = !value
        }
    }
    var body: some View {
        BaseView {
            if didShowSplash {
                if isOnboardingPresented.wrappedValue {
                    BaseNavigationView {
                       
                    }
                    
                    .onAppear {
                        self.didShowWalkthrough = true
                    }
                }
                else {
                    RootNavigationView()
                }
            } else {
                SplashView(splashCompleted: $didShowSplash)
            }
           
        }
        .onAppear {
            Config.shared.printAllConfigProperties()
        }
    }
    
}

#Preview {
    ContentView()
}



