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
        switch action {
            case .bookMarkShareActions(let action):
                switch action {
                    case .bookMarkClicked(id: let id, isBookMarked: let stat):
                        print("Bookamrk")
                    default:
                        break
                }
            case .onTapCardItem(id: let id, type: let type):
                print("onItemtap")
        }
        return .none
})
