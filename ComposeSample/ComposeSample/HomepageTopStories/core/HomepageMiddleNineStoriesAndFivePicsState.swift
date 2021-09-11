//
//  HomepageMiddleNineStoriesAndFivePicsState.swift
//  TodayOnline
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
import ComposableArchitecture
struct HomepageMiddleNineStoriesAndFivePicsState: Equatable {
    var topStory : CardTopViewState
    var storiesWithImage = IdentifiedArrayOf<CardItemState>()
    var storiesWithoutImage = IdentifiedArrayOf<CardItemState>()
}
