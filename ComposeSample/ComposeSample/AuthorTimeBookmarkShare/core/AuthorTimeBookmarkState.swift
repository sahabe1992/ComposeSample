//
//  AuthorTimeBookmarkState.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation

struct AuthorTimeBookmarkState : Equatable {
    var authorName : String = "" //Author name can be empty
    var since : String
    var isBookMarked : Bool
    var videoDuration : String = ""
    var id : Int
    var type : ArticleType = .article
}
