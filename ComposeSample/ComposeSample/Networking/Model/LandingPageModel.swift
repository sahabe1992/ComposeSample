//
//  LandingPageModel.swift
//
//  Created by Sahabe Alam on 25/03/21.
//

import Foundation
// MARK: - LandingPageModel
struct LandingPageModel: Codable, Equatable {
    let result: LandingPageData
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}
struct LandingPageData: Codable, Equatable {
    let title, freeform, webview, hederFooter: String?
    let brief: String?
    let url: String?
    
    let layout: [LandingLayout]
    
    enum CodingKeys: String, CodingKey {
        case hederFooter = "heder_footer"
        case title, freeform, webview, brief, url, layout
    }
}


//enum LoadingState:Equatable {
//    case NotLoaded
//    case Loading
//    case Loadded(HomeViewState)
//}
   

 enum LoadingState<Content> {
  case NotLoaded
  case Loading
  case loaded(Content)
}

extension LoadingState: Equatable where Content: Equatable {}
