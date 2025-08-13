//
//  Cart.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftData
import Foundation

/// Temp holding place for users selections, no need to go to the backend
struct Cart: Identifiable, Codable {
    var id: UUID
    var menuItems: MenuItems
    var quantity: Int
}
