//
//  Loader.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 05/08/21.
//

import SwiftUI
struct Loader: View {
    @State var animate = false
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [Color("todayRed")]), center: .center), style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .frame(width: 35, height: 35)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
        }.onAppear {
            self.animate.toggle()
        }
    }
    
}


