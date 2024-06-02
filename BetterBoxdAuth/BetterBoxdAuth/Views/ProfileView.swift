//
//  ProfileView.swift
//  BetterBoxdAuth
//
//  Created by Ahmed Ghaddah on 6/2/24.
//

import Foundation
import SwiftUI


struct ProfileView: View {
    var profile: Profile

    var body: some View {
        VStack {
            Text("Profile View")
                .font(.largeTitle)
                .padding()

            Text("Name: \(profile.name)")
            Text("Username: \(profile.username)")
            Text("Bio: \(profile.bio)")
            // Add other profile fields as needed

            Spacer()
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: .empty)
    }
}
