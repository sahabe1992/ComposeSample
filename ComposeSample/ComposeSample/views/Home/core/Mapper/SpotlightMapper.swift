//
//  SpotlightMapper.swift
//  ComposeSample
//
//  Created by Sahabe.Alam on 11/09/21.
//

import Foundation

func mapSpotlight(homeScreenComponent: MyComponent) -> SpotlightState {
    switch homeScreenComponent {
        case .spotlight(let uuid, let url, let cta):
            return SpotlightState(id: uuid.toInt(), imageMediaMobile: url, cta: cta, spotlightNavigation: getSpotlightNnavigation(type: cta.viewMoreType, id: cta.viewMoreId))
        default:
            break
    }
    return SpotlightState(id: 0, imageMediaMobile: "", cta: CTAData(viewMoreTitle: "", viewMoreUrl: "", viewMoreId: "", viewMoreType: ""), spotlightNavigation: SpotlightNavigation.article(""))
}

func getSpotlightNnavigation(type: String, id: String) -> SpotlightNavigation {
    
    if type == "article" {
        return .article(id)
    } else if type == "video" {
        return .video(id)
    }
    else if type == "landing_page" {
        return .landingPage(id)
    } else {
        return .webView(id)
    }
    
}
