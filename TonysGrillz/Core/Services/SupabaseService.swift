//
//  SupabaseService.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/2/25.
//

import Foundation
import Supabase

/// Step 2 of the Factory Method: Create all teh different types of your obejct
struct SupabaseService: BackendService {
    static let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://eckedzdtzhfwtessshjm.supabase.co")!,
        supabaseKey: AppEnviroment.supabseKey
    )
}
