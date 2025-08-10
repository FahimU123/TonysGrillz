//
//  MenuItems.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import SwiftData
import Foundation

struct MenuItems: Identifiable, Codable {
    var id: UUID
    var name: String
    var price: Double
    var details: String
    var isAvailable: Bool
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case details
        case isAvailable = "is_available"
        case image
    }
}

