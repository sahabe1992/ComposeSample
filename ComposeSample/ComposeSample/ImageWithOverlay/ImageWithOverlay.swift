//
//  ImageWithOverlay.swift
//  itodayetp (iOS)
//
//  Created by chanchal.kumari on 13/08/21.
//

import SwiftUI
import Kingfisher

struct ImageWithOverlay: View {
    let  imageOverelayState : ImageWithOverlayState
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            KFImage(URL(string: imageOverelayState.imageUrl))
                .resizable()
                .aspectRatio(CGSize(width: 4, height: 3), contentMode: .fit)
                .frame( alignment: .topLeading)
        })
        .if(!imageOverelayState.overlayText.isEmpty, transform: { view in
            view.overlay(TextOverlay(overlayTextState: OverlayTextState(overlayText: imageOverelayState.overlayText)), alignment: .bottomTrailing)
        })
        
    }
}


struct ImageWithOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ImageWithOverlay(imageOverelayState: ImageWithOverlayState(imageUrl: "newyork", overlayText: "Kun Chang-Min/today"))
    }
}


struct TextOverlay: View {
    let overlayTextState : OverlayTextState
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
        VStack(alignment: .leading) {
            Text(overlayTextState.overlayText).modifier(CustomTextModifier(font : Fonts.proximaNovaRegular.font(size: 12).weight(.regular), fontColor: .white, align: .center, isVertical: true, paddingEdges: .leading, paddingSize: 0, lineSpacing: 0))
        }
        .padding(.all,10)
        .background(Color(red: 33.0/255.0, green: 33.0/255.0, blue: 41/255.0, opacity: 0.7))
        .foregroundColor(.white)
        }
    }
}
