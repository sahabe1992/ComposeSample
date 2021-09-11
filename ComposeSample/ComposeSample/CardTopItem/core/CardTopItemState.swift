//
//  CardTopItemState.swift
//  TodayOnline
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation

struct CardTopViewState: Equatable,Identifiable {
    let id: Int
    var imageURL : String
    var title : String
    var brief : String
    var overlayText : String
    var type : ArticleType
    var authorBookmarkShareState : AuthorTimeBookmarkState?
}
