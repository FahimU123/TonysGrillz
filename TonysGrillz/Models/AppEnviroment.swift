//
//  AppEnvirement.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/2/25.
//

import Foundation

class AppEnvironment {
    static let supabaseURL: String = {
        guard let urlString = Bundle.main.infoDictionary?["Supabase URL"] as? String else {
            fatalError("Supabase URL not found in Info.plist")
        }
        return urlString
    }()
    
    static let supabaseKey: String = {
        guard let key = Bundle.main.infoDictionary?["Supabase Key"] as? String else {
            fatalError("Supabase Key not found in Info.plist")
        }
        return key
    }()
}
