//
//  User.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/3/25.
//

import Foundation

/// Holds all users and refers to the auth table in Supabse to get the info and is updated by Supabse trigger
struct User: Identifiable, Codable {
    let id: UUID
    let email: String
    let lastName: String
    let firstName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
