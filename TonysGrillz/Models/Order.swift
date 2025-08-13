//
//  Orders.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import Foundation

/// Holds a completed order, think of it like the header of a reciepts
struct Order: Identifiable, Codable {
    let id: UUID
    let userId: UUID
    var totalAmount: Double
    var status: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case totalAmount = "total_amount"
        case status
    }
}
