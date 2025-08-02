//
//  AppEnvirement.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/2/25.
//

import Foundation

class AppEnvironment {
    static let supabaseURL: URL = {
        guard let urlString = Bundle.main.infoDictionary?["Supabase URL"] as? String,
              let url = URL(string: urlString) else {
            fatalError("Supabase URL not found in Info.plist")
        }
        return url
    }()
    
    static let supabaseKey: String = {
        guard let key = Bundle.main.infoDictionary?["Supabase Key"] as? String else {
            fatalError("Supabase Key not found in Info.plist")
        }
        return key
    }()
}
