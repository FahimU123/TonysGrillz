//
//  MenuCard.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftUI

struct MenuItemCard: View {
    let item: MenuItems
    let cartViewModel: CartViewModel
    @State private var isPresenting = false
    let orderItemViewModel: OrderItemsViewModel
    
    var body: some View {
        Button {
            self.isPresenting = true
        } label: {
            VStack(alignment: .leading) {
                Image(item.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 120)
                    .clipped()
                    .cornerRadius(10)
                
                Text(item.name)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                
                Text(item.price, format: .currency(code: "USD"))
                    .font(.subheadline)
            }
            .padding(10)
            .cornerRadius(12)
   
        }
        .fullScreenCover(isPresented: $isPresenting) {
            MenuDetailView(cartViewModel: cartViewModel, item: item, orderItemViewModel: orderItemViewModel)
        }
    }
}
//#Preview {
//    MenuItemCard(item: MenuItems(id: UUID(), name: "ss", price: 12.99, details: "ddsssssssssssd", isAvailable: true, image: "burger"), cartViewModel: CartViewModel(), orderItemViewModel: OrderItemsViewModel())
//}

