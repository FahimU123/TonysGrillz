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
    
    var body: some View {
        TabView {
            if isLoggedIn {
                LoggedInView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
            } else {
                LoggedOutView(isLoggedIn: $isLoggedIn)
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
        .onAppear {
            Task {
                try await getCurrentUser()
            }
        }
    }
    
    /// Allows the user session to persist so they dont have to login everytime
    func getCurrentUser() async throws {
        try await SupabaseService.supabase.auth.session
        isLoggedIn = true
    }
}

#Preview {
    MainView()
}
