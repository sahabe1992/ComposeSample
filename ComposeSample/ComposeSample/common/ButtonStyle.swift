//
//  ButtonStyle.swift
//  Meconnect Login
//
//  Created by Srijan on 02/08/21.
//

import SwiftUI
struct Social: ButtonStyle {
    var iconName: String
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(iconName)
            configuration.label
        }
        .padding(.vertical)
        .font(.custom("Helvetica-bold", size: 15))
        .foregroundColor(Color.black)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(50.0)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct FillStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .background(Color("black"))
            .font(.headline)
            .cornerRadius(50)
        
    }
}

struct Today: ButtonStyle {
    var iconName: String
    var titleColor: Color = .black
    var backgroundColor:Color = .white
    
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Image(iconName)
        }
        .padding(.vertical)
        .font(Fonts.graphikMedium.font(size: 12))
        .foregroundColor(titleColor)
        .frame(height: 38, alignment: .center)
        .padding([.trailing, .leading], 15)
        .background(backgroundColor)

    }
}
