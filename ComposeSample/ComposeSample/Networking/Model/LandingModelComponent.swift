//
//  LandingModelComponent.swift
//  NewsCore
//
//  Created by Srijan on 06/09/21.
//

import Foundation

struct LandingModelComponent: Codable, Equatable {
    let uuid: String
    let label: String
    let type: String
    let viewMode: String
    enum CodingKeys: String, CodingKey {
        case label
        case uuid
        case type
        case viewMode = "view_mode"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid) ?? ""
        label = try values.decodeIfPresent(String.self, forKey: .label) ?? ""
        type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
        viewMode = try values.decodeIfPresent(String.self, forKey: .viewMode) ?? ""
    }
    
    var viewModeType: ViewModeType {
        if let type = detectViewModeTypeFrom(viewMode) {
            return type
        }
        return .other
    }
    var viewComponnentTypeType: ComponentType {
        if let type = detectTypeFrom(type) {
            return type
        }
        return .other
    }
    

}

enum ViewModeType: String {
    case middle9s5p
    case full
    case left7s5p
    case minuteFullWidth
    case numberedCarousel
    case aMiddle8s6p
    case listing4s4p
    case largeTiles2s2p
    case carousel
    case carouselJournalistsFull
    case featuredVideoLeft5s5p
    case aLeft5s5p
    case `default`
    case carouselWithoutNumbersFullWidth
    case other
}

enum ComponentType: String {
    case dynamicListing
    case interactive
    case spotlight
    case ciaWidget
    case subscription
    case other
}

func detectViewModeTypeFrom(_ name: String) -> ViewModeType? {
    switch name.lowercased() {
    case "middle_9s_5p": return .middle9s5p
    case "full": return .full
    case "left_7s_5p": return .left7s5p
    case "minute_full_width": return .minuteFullWidth
    case "numbered_carousel": return .numberedCarousel
    case "a_middle_8s_6p": return .aMiddle8s6p
    case "listing_4s_4p": return .listing4s4p
    case "large_tiles_2s_2p": return .largeTiles2s2p
    case "carousel": return .carousel
    case "carousel_journalists_full": return .carouselJournalistsFull
    case "featured_video_left_5s_5p": return .featuredVideoLeft5s5p
    case "a_left_5s_5p": return .aLeft5s5p
    case "carousel_without_numbers_full_width" : return .carouselWithoutNumbersFullWidth
    case "default": return .default
    default:
        return .other
    }
}


func detectTypeFrom(_ name: String) -> ComponentType? {
    switch name.lowercased() {
    case "dynamic_listing": return .dynamicListing
    case "interactive": return .interactive
    case "spotlight": return .spotlight
    case "cia_widget": return .ciaWidget
    case "subscription": return .subscription
    default:
        return .other
    }
}
