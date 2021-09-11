//
//  File.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation

enum ArticleType {
    case article
    case video
}

struct CardItemState: Equatable, Identifiable {
    let id: Int
    var imageUrl : String = ""
    var imageItemState : ImageItemState = .NoImage
    var title : String
    var description : String
    var type : ArticleType
    var isDividerShow : Bool = true
    
    var authorBookmarkShareState : AuthorTimeBookmarkState?
    
}
