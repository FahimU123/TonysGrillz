//
//  AccountView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import SwiftUI
import Supabase

struct AccountView: View {
    @State private var email = ""
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(isLoggedIn ? email : "Log In!")
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    // FIXME: This should be sign in or nothing when logg out
                    Button("Sign Out", role: .destructive) {
                        Task {
                            try? await SupabaseService.supabase.auth.signOut()
                            isLoggedIn = false
                            
                        }
                        
                    }
                }
            }
        }
        .onAppear {
            Task {
                let currentUser = SupabaseService.supabase.auth.currentUser
                self.email = currentUser?.email ?? "No email"
            }
        }
    }
}


#Preview {
    AccountView(isLoggedIn: .constant(true))
}
