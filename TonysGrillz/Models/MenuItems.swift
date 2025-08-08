//
//  MenuItems.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import SwiftData
import Foundation

 /*https://www.hackingwithswift.com/quick-start/swiftdata/how-to-make-swiftdata-models-conform-to-codable*/

@Model
class MenuItems: Identifiable, Codable {
    @Attribute(.unique) var id: UUID
    var name: String
    var price: Double
    var details: String
    var isAvailable: Bool
    var image: String
    
    init(id: UUID, name: String, price: Double, details: String, isAvailable: Bool, image: String) {
        self.id = id
        self.name = name
        self.price = price
        self.details = details
        self.isAvailable = isAvailable
        self.image = image
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        price = try container.decode(Double.self, forKey: .price)
        details = try container.decode(String.self, forKey: .details)
        isAvailable = try container.decode(Bool.self, forKey: .isAvailable)
        image = try container.decode(String.self, forKey: .image)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(price, forKey: .price)
        try container.encode(details, forKey: .details)
        try container.encode(isAvailable, forKey: .isAvailable)
        try container.encode(image, forKey: .image)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case details
        case isAvailable = "is_available"
        case image
    }
}

