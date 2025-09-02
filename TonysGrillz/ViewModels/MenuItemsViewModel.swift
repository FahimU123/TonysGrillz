//
//  MenuItemsViewModel.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import Foundation

/// Step 6 of the Factory Method: This is your client code, it does not ahve to chnage nay more as a result of this method, use dependecy injection so when initialzied it asks for a factory which can provide a type of the obejct you would like
@Observable
final class MenuItemsViewModel {
    var menuItems: [MenuItems] = []
    let backendService: BackendService
    
    init(factory: BackendServiceFactory) {
        self.backendService = factory.createBackendServiceFactory()
    }
    
    func loadMenuItems() async {
        do {
            menuItems = try await backendService.fetchMenuItems()
        } catch {
            print("Could not fetch menu items from Supbase \(error.localizedDescription)")
        }
    }
}
