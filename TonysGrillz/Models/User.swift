//
//  User.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let email: String
}
