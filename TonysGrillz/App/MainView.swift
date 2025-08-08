//
//  MainView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            LoggedOutView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            MenuView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "book")
                }
        }
    }
}

#Preview {
    MainView()
}
