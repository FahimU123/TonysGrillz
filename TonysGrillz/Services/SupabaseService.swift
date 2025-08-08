//
//  SupabaseService.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/2/25.
//

import Foundation
import Supabase

struct SupabaseService: BackendService {
    static let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://bbqnqwabvgujelzokgng.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJicW5xd2Fidmd1amVsem9rZ25nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQxNjQ4NzgsImV4cCI6MjA2OTc0MDg3OH0.T1Sdewt77loiP7F73khr9i-LxL26UJ1X31Nk96Pd21Y"
    )
}
