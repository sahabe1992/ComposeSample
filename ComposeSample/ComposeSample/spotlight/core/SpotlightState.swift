//
//  SpotlightState.swift
//  TodayOnline
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
struct SpotlightState: Equatable, Identifiable {
    var id: Int
    var imageMediaMobile : String
    var isWebViewPresented: Bool = false
    var cta: CTAData
    var spotlightNavigation: SpotlightNavigation
    
    
}

