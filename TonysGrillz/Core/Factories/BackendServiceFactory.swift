//
//  BackendServiceFactory.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/31/25.
//

import Foundation

/// Step 3 of the Factory Method: Create a "Abstarct Creator"
protocol BackendServiceFactory {
    func createBackendServiceFactory() -> BackendService
}

/// Step 5 of the Factory Method: Create the type of your object in as many factories as you would like
class SupabaseServiceFactory: BackendServiceFactory {
    func createBackendServiceFactory() -> BackendService {
        return SupabaseService()
    }
}
