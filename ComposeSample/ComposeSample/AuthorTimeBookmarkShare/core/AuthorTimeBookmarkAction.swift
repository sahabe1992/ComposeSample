//
//  AuthorTimeBookmarkAction.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation

enum AuthorTimeBookmarkAction {
    case bookMarkClicked(id:Int, isBookMarked: Bool)
    case shareClicked
    case receivedBookMarkResponse(Result<Bool,Never >)
}
