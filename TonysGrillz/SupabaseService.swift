//
//  SupabaseService.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/2/25.
//

import Foundation
import Supabase

struct SupabaseService {
    static let client = SupabaseClient(supabaseURL:AppEnvironment.supabaseURL,
                                supabaseKey: AppEnvironment.supabaseKey)
}
