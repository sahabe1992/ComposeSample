//
//  SpotlightState.swift
//  TodayOnline
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
struct SpotlightState: Equatable {
    var imageMediaMobile : String
    var viewMoreUrl: String = ""
    var viewMoreUrlFieldId: String? = ""
    var viewMoreUrlFieldType: String? = ""
    var isWebViewPresented: Bool = false
    var spotlightNavigation: SpotlightNavigation
    
    
}
