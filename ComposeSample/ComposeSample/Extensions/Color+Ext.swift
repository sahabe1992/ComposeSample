//
//  Color.swift
//  itodayetp
//
//  Created by Srijan on 29/07/21.
//

import Foundation
import SwiftUI
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Color {
    static let appRed = Color(hex: "d22d28")
    static let gray636363 = Color(hex: "636363")
    static let grayd5d5d5 = Color(hex: "d5d5d5")
    static let grayf5f5f5 = Color(hex: "f5f5f5")
    static let gray4a4f54 = Color(hex: "4a4f54")
    static let whited4d4d4 = Color(hex: "d4d4d4")
    static let grayeaeaea = Color(hex: "eaeaea")
    static let dark1e1e1e = Color(hex: "1e1e1e")
    static let darkDevider = Color(hex: "e0e0e0")
}
