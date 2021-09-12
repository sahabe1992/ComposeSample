//
//  CardTopItemReducer.swift
//  TodayOnline
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation

import ComposableArchitecture


let CardTopViewReducer = Reducer<CardTopViewState, CardTopViewAction, CardTopViewEnvironment >.combine(
    AuthorBookmarkShareReducer.pullback(
        state: \CardTopViewState.authorBookmarkShareState,
        action: /CardTopViewAction.bookMarkShareActions,
        environment:  { environment in
            AuthorTimeBookmarkEnviornment(UpdateBookmark: environment.UpdateBookmark, mainQueue: .main)
        }
    ),
    .init
    {
        state, action, env in
        return .none
//        switch action{
//        case .bookMarkShareActions(.bookMarkClicked(let id, let isBookMarked)):
//            print("BookMarkClicked")
//            return .none
//
//        case .bookMarkShareActions(.shareClicked):
//            return .none
//
//        case .bookMarkShareActions(.receivedBookMarkResponse(_)):
//            return .none
//        }
    }
)
