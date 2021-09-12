//
//  Component.swift
//  NewsCore
//
//  Created by Srijan on 06/09/21.
//

import Foundation

// MARK: - Welcome
struct LandingComponent: Codable, Equatable {
    let result: ComponentResult?
    
}

// MARK: - Result
struct ComponentResult: Codable , Equatable {
    let data :[Article]?
    let id, uuid, type, title: String
    let view_more_title : String?
    let field_sub_description ,title_url: String?
    let image : String?
    let view_more_url: String?
    let view_more_url_field_id: String?
    let view_more_url_field_type: String?
    let image_media_mobile: String?
    let body: String?
    let label: String?
    let placeholder: String?
    let sub_description: String?
}
struct Article: Codable , Equatable {
    let title_url, absolute_url,image_url,description,duration,release_date: String?
    let author_detail : AuthorDetail?
    let uuid, nid, type: String
    var  title: String
    let video: Video?
    let show_as_web_view: Bool
    
    var contentType: ArticleType {
        if let type = detecTypeFrom(type) {
            return type
        }
        return .article
    }
    
    func detecTypeFrom(_ name: String) -> ArticleType? {
        switch name.lowercased() {
            case "article": return .article
            case "video": return .video
                
            default:
                return .article
        }
    }
}


struct AuthorDetail : Codable , Equatable{
    let name, image_url,url :String?
}


struct Video: Codable, Equatable {
    let media_id:String
    let video_id: String
    let duration: String
    let account_id: String
    let player: String
    let caption: String
    let start_time: String?
    let end_time: String?
    let check_recurring: Bool
    let show_countdown: Bool
    let show_background_image: Bool
    let video_url_mp4:String
}


