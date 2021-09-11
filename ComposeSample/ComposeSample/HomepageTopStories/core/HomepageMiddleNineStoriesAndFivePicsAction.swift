//
//  HomepageMiddleNineStoriesAndFivePicsAction.swift
//  TodayOnline
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
import ComposableArchitecture
enum HomepageMiddleNineStoriesAndFivePicsAction {
    case viewAppeared
    case cardTopActions(CardTopViewAction)
    case cardListItemActions(id:Int,action:CardItemViewAction)
}
