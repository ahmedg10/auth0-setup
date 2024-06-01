//
//  Profile.swift
//  BetterBoxdAuth
//
//  Created by Ahmed Ghaddah on 5/31/24.
//

import Foundation

struct Profile {
    let id: String
    let name: String
    let email: String
    let emailVerified: String
    let picture: String
    let updatedAt: String
}

extension Profile {
    static var empty: Self {
        return Profile (
        id: "",
        name: "",
        email: "",
        emailVerified: "",
        picture: "",
        updatedAt: ""
        )
    }
}
