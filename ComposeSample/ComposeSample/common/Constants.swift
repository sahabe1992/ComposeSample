//
//  Constants.swift
//  Meconnect Login
//
//  Created by Srijan on 04/08/21.
//

import Foundation
import UIKit

struct Constants {
    static var nbPages = 0
    static let defaultURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"
    
    static var imageAspectRatio = 1.33 // 4/3

    struct MeConnect {
        static let emptyEmailErroMessage = "Please enter a email"
        static let invalidEmailErroMessage = "Please enter a valid email"
        static let passwordErroMessage = "Please enter your password"
        static let successMessage = "Thank you for your subscription lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore."
        static let clientId = "05bf8e42-5bb6-468c-9c89-143b20ba47e7"
        static let secretKey =  "66DFD35B-B889-4FC8-8793-8B664CA0102F"
        
        // Terms of Use
        static let termsOfUse = """
        This product and service are not applicable to persons residing in the EU. \
        Click to register a meCONNECT account, which means you agree to accept our <a>terms<a> and <a>privacy policy<a> .
        """
    }
}

struct TabBarIconsName {
    static let homeActive = "home-active"
    static let homeInactive = "home-inactive"
    static let sectionsActive = "sections-active"
    static let sectionsInactive = "sections-inactive"
    static let profileActive = "profile-active"
    static let profileInactive = "profile-inactive"
    static let bookmarkActive = "bookmark-active"
    static let bookmarkInactive = "bookmark-inactive"
}


enum Tab: String {
    case home = "HOME"
    case sections = "SECTIONS"
    case bookmarks = "BOOKMARKS"
    case profile = "YOU"
}

enum ImageItemState: Equatable {
    case NoImage
    case Image(String)
    case placeholder
}

enum SpotlightNavigation: Equatable {
    case webView(String)
    case video(String)
    case landingPage(String)
    case article(String)
}
