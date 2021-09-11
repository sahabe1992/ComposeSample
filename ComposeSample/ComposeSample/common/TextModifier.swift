//
//  Modifier.swift
//  Meconnect Login
//
//  Created by Srijan on 03/08/21.
//

import SwiftUI

struct CustomTextM: ViewModifier {
    //MARK:- PROPERTIES
    let fontName: String
    let fontSize: CGFloat
    let fontColor: Color
    let align: TextAlignment = .center
    let isVertical: Bool = true
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(fontColor)
            .padding()
            .multilineTextAlignment(align).fixedSize(horizontal: !isVertical, vertical: isVertical)
    }
}


struct CustomTextFieldM: ViewModifier {
    //MARK:- PROPERTIES
    let fontName: String
    let fontSize: CGFloat
    let fontColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(fontColor)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 50).stroke(lineWidth: 1).foregroundColor(Color("gray")))
    }
}


struct TextFieldM: ViewModifier {
    //MARK:- PROPERTIES
    let fontName: String
    let fontSize: CGFloat
    let fontColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(fontColor)
    }
}

struct TitleM: ViewModifier {
    var lineLimit = 1
    var alinment: Alignment = .leading
    var foregroundColor:Color = .black
    func body(content: Content) -> some View {
        content
            .font(Fonts.graphikSemibold.font(size: 24))
            .foregroundColor(foregroundColor)
            .lineLimit(lineLimit)
            .frame(maxWidth: .infinity, alignment: alinment)
    }
}


struct ParagraphM: ViewModifier {
    var font: Font = Fonts.proximaNovaRegular.font(size: 15)
    var foregroundColor:Color = .black
    var alinment: Alignment = .leading
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(foregroundColor)
            .lineSpacing(1.14)
            .multilineTextAlignment(.leading).fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, alignment: alinment)
    }
}

struct CommonTextM: ViewModifier {
    var font: Font
    var foregroundColor:Color = .black
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(foregroundColor)
    }
}

struct TitleOverlayTextM: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Fonts.graphikSemibold.font(size: 15))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .lineSpacing(1.33)
    }
}

struct CustomTextModifier: ViewModifier {
    //MARK:- PROPERTIES
    let font: Font
    let fontColor: Color
    let align: TextAlignment
    let isVertical: Bool
    let paddingEdges : Edge.Set
    let paddingSize : CGFloat
    let lineSpacing : CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(fontColor)
            .padding(paddingEdges, paddingSize)
            .multilineTextAlignment(align).fixedSize(horizontal: !isVertical, vertical: isVertical)
            .lineSpacing(lineSpacing)
    }
}



