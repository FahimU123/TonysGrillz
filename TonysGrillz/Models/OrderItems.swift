//
//  OrderItem.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import Foundation

/// like the details of a receipt, the item, quantity, etc
struct OrderItems: Identifiable, Codable {
    let id: UUID
    let orderId: UUID
    var menuItemId: UUID
    var quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case orderId = "order_id"
        case menuItemId = "menu_item_id"
        case quantity
    }
}
