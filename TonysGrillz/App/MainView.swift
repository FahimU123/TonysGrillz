//
//  MainView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftUI

struct MainView: View {
    @State private var cartViewModel = CartViewModel()
    @State private var isLoggedIn: Bool = false
    @State private var user: Profile?
    
    var body: some View {
        TabView {
            if isLoggedIn {
                LoggedInView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
            } else {
                LoggedOutView(isLoggedIn: $isLoggedIn, user: $user)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
            }
            
            MenuView(cartViewModel: cartViewModel)
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            
            CartView(cartViewModel: cartViewModel)
                .tabItem {
                    Label("Cart", systemImage: "book")
                }
            
            AccountView(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainView()
}
