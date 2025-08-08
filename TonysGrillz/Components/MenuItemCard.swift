//
//  MenuCard.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftUI

struct MenuItemCard: View {
    let item: MenuItems
    var cartViewModel: CartViewModel
    @State private var isPresenting = false
    
    var body: some View {
        Button {
            self.isPresenting = true
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Image(item.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 120)
                    .clipped()
                    .cornerRadius(10)
                
                Text(item.name)
                    .font(.headline)
                
                Text(item.price, format: .currency(code: "USD"))
                    .font(.subheadline)
            }
            .padding(10)
            .cornerRadius(12)
   
        }
        .fullScreenCover(isPresented: $isPresenting) {
      
            MenuDetailView(cartViewModel: cartViewModel, item: item)
        }
    }
}
//#Preview {
//    MenuItemCard(item: MenuItems(id: UUID(), name: "", price: 12.99, description: "", isAvailable: true, image: "burger"), cartViewModel: CartViewModel())
//}

