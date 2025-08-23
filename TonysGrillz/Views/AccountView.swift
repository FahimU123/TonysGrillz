//
//  AccountView.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import SwiftUI
import Supabase

struct AccountView: View {
    @State var email = ""
    @State var fullName = ""
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(email)
                Text(fullName)
              
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
        .onAppear {
            Task {
                await getInitialProfile()
            }
        }
    }
    
    func getInitialProfile() async {
        do {
            let currentUser = try await SupabaseService.supabase.auth.session.user
            let profile: Profile =
            try await SupabaseService.supabase
                .from("profiles")
                .select()
                .eq("id", value: currentUser.id)
                .single()
                .execute()
                .value
            
            self.email = profile.email
            self.fullName = profile.fullName
            
        } catch {
            debugPrint(error)
        }
    }
}


//#Preview {
//    AccountView(isLoggedIn: .constant(true), user: User(id: UUID(), email: "fahimuddin956@gmail.com", fullName: "Fahim Uddin"))
//}
