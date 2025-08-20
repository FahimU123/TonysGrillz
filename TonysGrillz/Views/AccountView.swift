//
//  AccountView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import SwiftUI
import Supabase

struct AccountView: View {
    let user: User?
    var body: some View {
        NavigationStack {
            VStack {
                Text(user!.email ?? "")
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

        }
    }
}

#Preview {
    AccountView(user: User(id: UUID(), email: "fahimuddin956@gmail.com", fullName: "Fahim Uddin"))
}
