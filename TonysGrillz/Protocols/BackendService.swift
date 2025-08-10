//
//  BackendService.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import Foundation

protocol BackendService {
    func fetchMenuItems() async throws -> [MenuItems]
    func signOut() async throws
}

extension BackendService {
    func fetchMenuItems() async throws -> [MenuItems] {
        let menuItems: [MenuItems] = try await SupabaseService.supabase
            .from("menu_items")
            .select()
            .execute()
            .value
        return menuItems
    }
}

extension BackendService {
    func signOut() async throws {
        try await SupabaseService.supabase.auth.signOut()
    }
}
