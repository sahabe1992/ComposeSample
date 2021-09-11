//
//  AuthorTimeBookmarkReducer.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation
import ComposableArchitecture

let AuthorBookmarkShareReducer = Reducer<AuthorTimeBookmarkState,AuthorTimeBookmarkAction,AuthorTimeBookmarkEnviornment > { state, action, env in
    
    struct BookmarkShareCancelId: Hashable {}

    switch (action)
    {
    case .bookMarkClicked(let id, let isBookMarked):
        let body : [String: Any] = ["id" : id, "isBookMarked" : !isBookMarked]
        return .concatenate(
             env.UpdateBookmark(body)
            .receive(on: env.mainQueue)
            .catchToEffect()
            .map(AuthorTimeBookmarkAction.receivedBookMarkResponse)
        )
        
    case .shareClicked:
        print("Share Clicked")
        return .none
        
    case .receivedBookMarkResponse(let data):
        print("Response received")
//        if responseVal {
//            state.isBookMarked = !state.isBookMarked
//        }
        return .none
    }
    
}
