//
//  CartViewModel.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import Foundation


struct CartViewModel {
    var cartItem: [Cart] = []
    
    mutating func addToCart(item: MenuItems) {
        /// If it is already in the acrt, then increment quantity
        if let index = cartItem.firstIndex(where: { $0.menuItems.id == item.id}) {
            cartItem[index].quantity += 1
        } else {
           let newCartItems = Cart(id: UUID(), menuItems: item, quantity: 1)
            cartItem.append(newCartItems)
        }
    }
    
    func removeFromCart(item: MenuItems) {
        
    }
}
