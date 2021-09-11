//
//  PageControl.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 18/08/21.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPageIndex: Int
    var pageIndicatorTintColor: UIColor = UIColor.white.withAlphaComponent(0.2)
    var currentPageIndicatorTintColor: UIColor = UIColor.white
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        return control
    }
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPageIndex
        uiView.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        uiView.pageIndicatorTintColor = pageIndicatorTintColor
    }
}


struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl(numberOfPages: 5, currentPageIndex: .constant(0),pageIndicatorTintColor: .red,currentPageIndicatorTintColor: .orange)
    }
}
