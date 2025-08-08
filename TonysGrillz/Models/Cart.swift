//
//  Cart.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/7/25.
//

import Foundation

struct Cart: Identifiable {
    let id: UUID
    let menuItems: MenuItems
    var quantity: Int
}
