//
//  AccountView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import SwiftUI
import Supabase

struct AccountView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Sign Out", role: .destructive) {
                        Task {
                            try? await SupabaseService.supabase.auth.signOut()
                        }
                    }
                }
            }
            .task {
                await getInitialProfile()
            }
        }
    }
    
    func getInitialProfile() async {
        do {
            let currentUser = try await SupabaseService.supabase.auth.session.user
            try await SupabaseService.supabase
                .from("users")
                .select()
                .eq("id", value: currentUser.id)
                .single()
                .execute()
                .value
           
        } catch {
            debugPrint(error)
        }
    }
}

#Preview {
    AccountView()
}
