//
//  CardItemAction.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation

enum CardItemViewAction {
    case bookMarkShareActions(AuthorTimeBookmarkAction)
    case onTapCardItem(id:Int, type: ArticleType)
}
