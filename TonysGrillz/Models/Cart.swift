//
//  Cart.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftData
import Foundation

@Model
class Cart: Identifiable {
    var id: UUID
    var menuItems: MenuItems
    var quantity: Int
    
    init(id: UUID, menuItems: MenuItems, quantity: Int) {
        self.id = id
        self.menuItems = menuItems
        self.quantity = quantity
    }
}
