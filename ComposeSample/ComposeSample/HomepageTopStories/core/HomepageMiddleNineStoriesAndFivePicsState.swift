//
//  HomepageMiddleNineStoriesAndFivePicsState.swift
//  TodayOnline
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
import ComposableArchitecture
struct HomepageMiddleNineStoriesAndFivePicsState: Equatable, Identifiable {
    var id:String
    var topStory : CardTopViewState
    var stories = IdentifiedArrayOf<CardItemState>()
    
}
