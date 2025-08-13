//
//  LoggedOut.swift
//  TonysGrillz
//
//  Created by Fahim Uddin on 8/5/25.
//

import AuthenticationServices
import SwiftUI

struct LoggedOutView: View {
    var body: some View {
        VStack {
            SignInWithAppleButton { request in
                request.requestedScopes = [.email, .fullName]
            } onCompletion: { result in
                Task {
                    do {
                        guard let credential = try result.get().credential as? ASAuthorizationAppleIDCredential
                        else {
                            return
                        }
                        guard let idToken = credential.identityToken
                            .flatMap({ String(data: $0, encoding: .utf8) })
                        else {
                            return
                        }
                        try await SupabaseService.supabase.auth.signInWithIdToken(
                            credentials: .init(
                                provider: .apple,
                                idToken: idToken
                            )
                        )
                    } catch {
                        dump(error)
                    }
                }
            }
            .fixedSize()
            
            Button {
                Task {
                    _ = try await SupabaseService.supabase.auth.signInAnonymously()
                }
            } label: {
                Text("Anon Sign In")
            }
        }
    }
}


#Preview {
    LoggedOutView()
}

