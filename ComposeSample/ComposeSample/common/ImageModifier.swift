//
//  ImageModifier.swift
//  itodayetp (iOS)
//
//  Created by chanchal.kumari on 12/08/21.
//

import SwiftUI


struct ImageModifier: ViewModifier {
    //MARK:- PROPERTIES
    let aspectRatio : CGFloat
    let contentMode : ContentMode
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(aspectRatio, contentMode: contentMode)
            
    }
}
