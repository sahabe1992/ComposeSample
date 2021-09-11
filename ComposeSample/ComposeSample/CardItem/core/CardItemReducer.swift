//
//  CardItemReducer.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation
import ComposableArchitecture

let CardItemReducer : Reducer<CardItemState, CardItemViewAction, CardItemViewEnvironment> = .combine(
    AuthorBookmarkShareReducer.pullback(
      state: \CardItemState.authorBookmarkShareState! ,
      action: /CardItemViewAction.bookMarkShareActions,
      environment:  { environment in
        AuthorTimeBookmarkEnviornment(UpdateBookmark: environment.UpdateBookmark, mainQueue: .main)
      }
    ),
    .init
    {
    state, action, env in
        return .none
})
