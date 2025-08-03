//
//  Orders.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import Foundation

struct Order: Identifiable, Codable {
    let id: UUID
    let user_id: UUID
    let total_amount: Double
    let status: String
    let created_at: Date
}
