//
//  MainView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftUI

struct MainView: View {
    @State private var cartViewModel = CartViewModel()
    
    var body: some View {
        TabView {
            LoggedOutView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            MenuView(cartViewModel: cartViewModel)
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            
            CartView(cartViewModel: cartViewModel)
                .tabItem {
                    Label("Cart", systemImage: "book")
            }
        }
    }
}

#Preview {
    MainView()
}
