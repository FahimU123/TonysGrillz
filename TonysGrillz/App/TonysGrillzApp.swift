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
// Local first architecture
// More documentation
// Look more into this article

//https://medium.com/@mabuex/local-first-with-swiftdata-and-supabase-434b0a473dd6
