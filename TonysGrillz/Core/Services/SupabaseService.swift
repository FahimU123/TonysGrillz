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


//struct SupabaseService: BackendService {
//    static let supabase = SupabaseClient(
//        supabaseURL: URL(string: "https://eckedzdtzhfwtessshjm.supabase.co")!,
//        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVja2VkemR0emhmd3Rlc3NzaGptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYyMTYzMzUsImV4cCI6MjA3MTc5MjMzNX0.YY8EFSs6pUFBdx66fd5nlEjuQGY3QBs_piqMED5qNYE"
//    )
//}
