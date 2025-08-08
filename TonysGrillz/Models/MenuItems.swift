//
//  MenuItems.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import SwiftData
import Foundation

@Model
class MenuItems: Identifiable, Codable {
    let id: UUID
    let name: String
    let price: Double
    let description: String
    let isAvailable: Bool
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case description
        case isAvailable = "is_available"
        case image
    }
}

