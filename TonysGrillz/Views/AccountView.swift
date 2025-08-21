//
//  AccountView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import SwiftUI
import Supabase

struct AccountView: View {
    @Binding var isLoggedIn: Bool
    let user: User?
    var body: some View {
        NavigationStack {
            VStack {
                Text(user?.email ?? "aint wokr")
                Text(user?.fullName ?? "no name")
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Sign Out", role: .destructive) {
                        Task {
                            try? await SupabaseService.supabase.auth.signOut()
                            isLoggedIn = false
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AccountView(isLoggedIn: .constant(true), user: User(id: UUID(), email: "fahimuddin956@gmail.com", fullName: "Fahim Uddin"))
}
