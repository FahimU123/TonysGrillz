//
//  TonysGrillzApp.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/2/25.
//

import SwiftData
import SwiftUI

@main
struct TonysGrillzApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: [Cart.self, MenuItems.self])
        }
    }
}

// Next Steps:
// Data persistence for cart methods
// Everything in SwiftData seems setup, next up is fetching the information
// More documentation
