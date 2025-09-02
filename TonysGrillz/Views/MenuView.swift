//
//  MenuView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import SwiftUI

struct MenuView: View {
    /// Step 7 of the Factory Method:  Now give it a factory which prodcues the backend you would like
    @State private var menuItemsViewModel = MenuItemsViewModel(factory: SupabaseServiceFactory())
    
    let cartViewModel: CartViewModel
    let orderItemViewModel: OrderItemsViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)], spacing: 15) {
                        ForEach(menuItemsViewModel.menuItems) { item in
                            MenuItemCard(item: item, cartViewModel: cartViewModel, orderItemViewModel: orderItemViewModel)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Main Menu")
            // FIXME: Search feature here. Refer to HIG
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
    MenuView(cartViewModel: CartViewModel(), orderItemViewModel: OrderItemsViewModel())
}
