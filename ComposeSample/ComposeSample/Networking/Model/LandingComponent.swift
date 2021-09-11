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
    let data :[ComponentData]?
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
struct ComponentData: Codable , Equatable {
    
    let type, title_url, absolute_url,image_url,description,duration,release_date: String?
    let author_detail : AuthorDetail?
    let uuid, nid: String
    var  title: String
    
    
}


struct AuthorDetail : Codable , Equatable{
    let name, image_url,url :String?
}
