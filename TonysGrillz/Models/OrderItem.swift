//
//  OrderItem.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import Foundation

struct OrderItem: Identifiable, Codable {
    let id: UUID
    let order_id: UUID
    let menu_item_id: UUID
    let quantity: Int
}
