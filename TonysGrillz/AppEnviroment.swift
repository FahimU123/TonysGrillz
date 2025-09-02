//
//  AppEnviroment.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 9/2/25.
//

import Foundation


public enum AppEnviroment {
    enum Keys {
        static let supabaseKey = "SUPABASE_KEY"
    }
    
    // Getting plist here
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found!")
        }
        return dict
    }()
    
    // Get apiKey and baseURL from plist
    static let supabseKey: String = {
        guard let supabseKeyString = AppEnviroment.infoDictionary[Keys.supabaseKey] as? String else {
            fatalError("Base URL not set in plist")
        }
        return supabseKeyString
    }()
}
