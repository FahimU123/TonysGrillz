//
//  MenuView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import SwiftUI

struct MenuView: View {
    @State private var menuItemsViewModel = MenuItemsViewModel(backendService: SupabaseService())
    let cartViewModel: CartViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)], spacing: 15) {
                        ForEach(menuItemsViewModel.menuItems) { item in
                            MenuItemCard(item: item, cartViewModel: cartViewModel)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Main Menu")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                        CartView(cartViewModel: cartViewModel)
                    } label: {
                        Image(systemName: "cart")
                    }
                }
            }
            .onAppear {
                Task {
                    await menuItemsViewModel.loadMenuItems()
                }
            }
        }
    }
}

#Preview {
    MenuView(cartViewModel: CartViewModel())
}
