//
//  Styling.swift
//  BetterBoxdAuth
//
//  Created by Ahmed Ghaddah on 6/2/24.
//

import Foundation
import SwiftUI


struct TitleStyle: ViewModifier {
    let titleFontBold = Font.title.weight(.bold)
    let navyBlue = Color(red: 0, green: 0, blue: 0.5)
    
    func body(content: Content) -> some View {
        content
            .font(titleFontBold)
            .foregroundColor(.white)
            .padding()
    }
}

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.fromHex("#7E7F9A"))
            .foregroundColor(Color.fromHex("#CACACA"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(AngularGradient(
                        gradient: Gradient(colors: [
                            Color.fromHex("#434456"),
                            Color.fromHex("#EB9486"),
                            Color.fromHex("#F3DE8A"),
                            Color.fromHex("#7E7F9A"),
                            Color.fromHex("#F9F8F8")
                        ]),
                        center: .center
                    ), lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}


struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.white)
            .cornerRadius(20)// Remove background shading
            .foregroundColor(Color.black) // Set text color to white
    }
}

extension Color {
    static func fromHex(_ hex: String) -> Color {
            var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            hexSanitized = hexSanitized.hasPrefix("#") ? String(hexSanitized.dropFirst()) : hexSanitized

            let scanner = Scanner(string: hexSanitized)
            var rgbValue: UInt64 = 0
            scanner.scanHexInt64(&rgbValue)

            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0

            return Color(red: red, green: green, blue: blue)
        }
    static let customBackground = Color(red: 39/255, green: 40/255, blue: 56/255)
    static let primary = Color(red: 243/255, green: 222/255, blue: 138/255)
    static let secondary = Color(red: 235/255, green: 148/255, blue: 134/255)
    static let highlight = Color(red: 39/255, green: 40/255, blue: 56/255)
    static let text = Color(red: 249/255, green: 248/255, blue: 248/255)
    static let lightGray = Color(UIColor.lightGray.withAlphaComponent(0.3))
    static let darkGray = Color(UIColor.darkGray)
}
