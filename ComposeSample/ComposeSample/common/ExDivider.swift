//
//  ExDivider.swift
//  Meconnect Login
//
//  Created by Srijan on 02/08/21.
//

import SwiftUI

struct ExDivider: View {
    var color: Color = Color("gray")
    let width: CGFloat = 1
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}

struct ExDivider_Previews: PreviewProvider {
    static var previews: some View {
        ExDivider()
    }
}
