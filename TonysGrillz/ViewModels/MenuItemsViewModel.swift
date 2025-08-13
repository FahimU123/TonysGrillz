//
//  MenuItemsViewModel.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import Foundation

@Observable
final class MenuItemsViewModel {
    var menuItems: [MenuItems] = []
    let backendService: BackendService
    
    init(backendService: BackendService) {
        self.backendService = backendService
    }
    
    func loadMenuItems() async {
        do {
            menuItems = try await backendService.fetchMenuItems()
        } catch {
            print("Could not fetch menu items from Supbase \(error.localizedDescription)")
        }
    }
}
