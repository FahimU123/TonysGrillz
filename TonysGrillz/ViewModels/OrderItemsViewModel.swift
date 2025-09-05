//
//  OrderViewItemsViewModel.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/28/25.
//

import Foundation

@Observable
final class OrderItemsViewModel {
    var orderItems: [OrderItems] = []
    
    func saveOrder(item: MenuItems) async throws {
        do {
            try await SupabaseService.supabase
                .from("order_items")
                .insert(orderItems)
                .execute()
        } catch {
            AppLogger.shared.debug("cant save order \(error.localizedDescription)")
        }
    }
}
