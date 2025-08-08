//
//  Orders.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import Foundation

struct Order: Identifiable, Codable {
    let id: UUID
    let userId: UUID
    let totalAmount: Double
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case totalAmount = "total_amount"
        case status
    }
}
