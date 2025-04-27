//
//  AccountView.swift
//  LunchboxClient
//
//  Created by Ambrose Mbayi on 24/04/2025.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        BaseNavigationView {
            Text("Account Page View")
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    AccountView()
}
