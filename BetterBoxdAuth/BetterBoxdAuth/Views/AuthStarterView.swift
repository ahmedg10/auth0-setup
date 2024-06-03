//
//  AuthStarterView.swift
//  BetterBoxdAuth
//
//  Created by Ahmed Ghaddah on 5/31/24.
//

import SwiftUI
import Auth0

struct AuthStarterView: View {
    @StateObject private var authViewModel = AuthController()
    
    var body: some View {
        NavigationView {
            if authViewModel.isAuthenticated {
                SlowOnboardingView(profile: $authViewModel.userProfile)
            } else {
                VStack {
                    Text("SwiftUI Login Demo")
                        .modifier(TitleStyle())
                    
                    Button("Log in") {
                        authViewModel.login()
                    }
                    .buttonStyle(CustomButtonStyle())
                }
            }
        }
    }
}

struct AuthStarterView_Previews: PreviewProvider {
    static var previews: some View {
        AuthStarterView()
    }
}
