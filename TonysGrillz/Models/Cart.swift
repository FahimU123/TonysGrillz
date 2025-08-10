//
//  Cart.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import SwiftData
import Foundation

struct Cart: Identifiable, Codable {
    var id: UUID
    var menuItems: MenuItems
    var quantity: Int
}
