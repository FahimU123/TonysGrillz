//
//  OrderItem.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import Foundation

struct OrderItem: Identifiable, Codable {
    let id: UUID
    let orderId: UUID
    let menuItemId: UUID
    let quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case orderId = "order_id"
        case menuItemId = "menu_item_id"
        case quantity
    }
}
