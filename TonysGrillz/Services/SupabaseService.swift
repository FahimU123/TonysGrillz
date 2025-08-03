//
//  SupabaseService.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/2/25.
//

import Foundation
import Supabase

struct SupabaseService {
    static let supabase = SupabaseClient(
        supabaseURL: URL(string: AppEnvironment.supabaseURL)!,
        supabaseKey: AppEnvironment.supabaseKey
    )
}
