//
//  HomeViewAction.swift
//  NewsCore
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
enum HomeViewAction {
    case homepageMiddleNineStoriesAndFivePicsActions(HomepageMiddleNineStoriesAndFivePicsAction)
    case homePageSpotlightActions(SpotlightAction)
    case LoadNext
    case NextComponentLoaded(MyComponent)
}
