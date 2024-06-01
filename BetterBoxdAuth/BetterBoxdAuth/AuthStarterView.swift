//
//  AuthStarterView.swift
//  BetterBoxdAuth
//
//  Created by Ahmed Ghaddah on 5/31/24.
//

import SwiftUI
import Auth0

struct AuthStarterView: View {
    @State private var isAuthenticated = false
    @State var userProfile = UserProfile.empty
    
    var body: some View {
        if isAuthenticated {
            VStack {
                Text("You’re logged in!")
                    .modifier(TitleStyle())
                
                UserImage(urlString: userProfile.picture)
                
                VStack {
                    Text("Name: \(userProfile.name)")
                    Text("Email: \(userProfile.email)")
                }
                .padding()
                
                Button("Log out") {
                    logout()
                }
                .buttonStyle(MyButtonStyle())
            }
        } else {
            VStack {
                Text("SwiftUI Login Demo")
                    .modifier(TitleStyle())
                
                Button("Log in") {
                    login()
                }
                .buttonStyle(MyButtonStyle())
            }
        }
    }
    
    private func login() {
        Auth0
            .webAuth()
            .start {
                result in
                
                switch result {
                case .failure(let error):
                    //user pressed "cancel" on Universal Login
                    print("failed with \(error)")
                case .success(let credentials):
                    self.isAuthenticated = true
                    print("Credentials: \(credentials)")
                    print("ID token: \(credentials.idToken)")
                }
            }
    }
    
    private func logout() {
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .failure(let error):
                    print("failed with: \(error)")
                case .success:
                    self.isAuthenticated = false
                }
            }
    }
}

struct UserImage: View {
    var urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 128)
        } placeholder: {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 128)
                .foregroundColor(.blue)
                .opacity(0.5)
        }
        .padding(40)
    }
}

struct TitleStyle: ViewModifier {
    let titleFontBold = Font.title.weight(.bold)
    let navyBlue = Color(red: 0, green: 0, blue: 0.5)
    
    func body(content: Content) -> some View {
        content
            .font(titleFontBold)
            .foregroundColor(navyBlue)
            .padding()
    }
}

struct MyButtonStyle: ButtonStyle {
    let navyBlue = Color(red: 0, green: 0, blue: 0.5)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(navyBlue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct UserProfile {
    var name: String
    var email: String
    var picture: String
    
    static var empty: UserProfile {
        return UserProfile(name: "", email: "", picture: "")
    }
}

#Preview {
    AuthStarterView()
}

