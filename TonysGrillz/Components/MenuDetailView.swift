//
//  MenuDetailView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftUI

struct MenuDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    var cartViewModel: CartViewModel
    let item: MenuItems
    var body: some View {
        VStack(alignment: .leading) {
                Button {
                    dismiss()
                } label: {
                    Text("dismiss")
                }
                
                Text("\(item.name)")
            
            Button {
                cartViewModel.addToCart(item: item)
                modelContext.insert(item)
                
            } label: {
                Text("add to cart")
            }
            }
        
    }
}

//#Preview {
//    MenuDetailView(cartViewModel: CartViewModel(), item: MenuItems(id: UUID(), name: "", price: 12.99, description: "", isAvailable: true, image: "burger")
//    )
//}

