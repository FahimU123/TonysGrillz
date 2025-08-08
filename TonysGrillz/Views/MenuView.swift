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
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)], spacing: 15) {
                        ForEach(menuItemsViewModel.menuItems) { item in
                            MenuItemCard(item: item)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Main Menu")
            .onAppear {
                Task {
                    await menuItemsViewModel.loadMenuItems()
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
