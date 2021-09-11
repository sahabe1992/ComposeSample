//
//  Fonts.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 12/08/21.
//

import Foundation
import SwiftUI
enum Fonts {
    case proximaNovaRegular
    case proximaNovaRegularItalic
    case proximaNovaLight
    case proximaNovaLightItalic
    case proximaNovaSemibold
    case proximaNovaSemiboldItalic
    case proximaNovaBold
    case proximaNovaBoldItalic
    case proximaNovaExtrabld
    case proximaNovaMedium
    case proximaNovaMediumItalic
    
    case graphikRegular
    case graphikThin
    case graphikLight
    case graphikMedium
    case graphikSemibold
    case graphikSemiboldItalic
    case graphikBold
    
    
    func font(size: CGFloat) -> Font {
        var fontFamily = Font.custom("ProximaNova-Regular", size: size)
        switch self {
        case .proximaNovaRegular:
            fontFamily = Font.custom("ProximaNova-Regular", size: size)
        case .proximaNovaRegularItalic:
            fontFamily = Font.custom("ProximaNova-RegularIt", size: size)
        case .proximaNovaLight:
            fontFamily = Font.custom("ProximaNova-Light", size: size)
        case .proximaNovaLightItalic:
            fontFamily = Font.custom("ProximaNova-LightIt", size: size)
        case .proximaNovaSemibold:
            fontFamily = Font.custom("ProximaNova-Semibold", size: size)
        case .proximaNovaSemiboldItalic:
            fontFamily = Font.custom("ProximaNova-SemiboldIt", size: size)
        case .proximaNovaBold:
            fontFamily = Font.custom("ProximaNova-Bold", size: size)
        case .proximaNovaBoldItalic:
            fontFamily = Font.custom("ProximaNova-BoldIt", size: size)
        case .proximaNovaExtrabld:
            fontFamily = Font.custom("ProximaNova-Extrabld", size: size)
        case .proximaNovaMedium:
            fontFamily = Font.custom("ProximaNova-Medium", size: size)
        case.proximaNovaMediumItalic:
            fontFamily = Font.custom("ProximaNovaW07-MediumItalic", size: size)
        case .graphikRegular:
            fontFamily = Font.custom("Graphik-Regular", size: size)
        case .graphikThin:
            fontFamily = Font.custom("Graphik-Thin", size: size)
        case .graphikLight:
            fontFamily = Font.custom("Graphik-Light", size: size)
        case .graphikMedium:
            fontFamily = Font.custom("Graphik-Medium", size: size)
        case .graphikSemibold:
            fontFamily = Font.custom("Graphik-Semibold", size: size)
        case .graphikBold:
            fontFamily = Font.custom("Graphik-Bold", size: size)
        case .graphikSemiboldItalic:
            fontFamily = Font.custom("Graphik-SemiboldItalic", size: size)
        }
        
        return fontFamily
    }
}
