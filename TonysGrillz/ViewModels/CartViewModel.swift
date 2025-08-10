//
//  CartViewModel.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import Foundation

@Observable
class CartViewModel {
    var cartItem: [Cart] = []
    
    func addToCart(item: MenuItems) {
        /// If it is already in the cart, then increment quantity
        if let index = cartItem.firstIndex(where: { $0.menuItems.id == item.id}) {
            cartItem[index].quantity += 1
        } else {
           let newCartItems = Cart(id: UUID(), menuItems: item, quantity: 1)
            cartItem.append(newCartItems)
        }
    }
    
    func increaseQuantity(item: MenuItems) {
        if let index = cartItem.firstIndex(where: { $0.menuItems.id == item.id}) {
            cartItem[index].quantity += 1
        }
    }
    
    func decreaseQuantity(item: MenuItems) {
        if let index = cartItem.firstIndex(where: { $0.menuItems.id == item.id}) {
            cartItem[index].quantity -= 1
            if cartItem[index].quantity <= 0 {
                cartItem.remove(at: index)
            }
        }
    }
    
    func clearCart() {
        cartItem.removeAll()
    }
    
    var subtotal: Double {
        cartItem.reduce(0) { result, item in
            return result + Double(item.quantity) * item.menuItems.price
        }
    }
    
    var tax: Double {
        subtotal * 0.06
    }
    
    var grandTotal: Double {
        subtotal + tax
    }
}
