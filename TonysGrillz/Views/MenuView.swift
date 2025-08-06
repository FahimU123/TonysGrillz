//
//  MenuView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import SwiftUI

struct MenuView: View {
    @State private var menuItemsViewModel = MenuItemsViewModel(backendService: SupabaseService())

    var body: some View {
        VStack {
            ForEach(menuItemsViewModel.menuItems) { menuItems in
                Text(menuItems.name)
            }
        }
        .onAppear {
            Task {
                await menuItemsViewModel.loadMenuItems()
            }
        }
    }
}

#Preview {
    MenuView()
}
