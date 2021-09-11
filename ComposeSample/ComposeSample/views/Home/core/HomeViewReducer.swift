//
//  Reducer.swift
//  NewsCore
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
import ComposableArchitecture
let homeViewReducer = Reducer<HomeViewState, HomeViewAction, HomeViewEnvironment> {
 state, action, environment in
  return .none
}
enum ViewModes  : String {
    case middle_9s_5p
    case listing_4s_4p
    case large_tiles_2s_2p
    case left_7s_5p
    case a_left_5s_5p
    case a_middle_8s_6p
    case carousel_without_numbers_full_width
    case carousel_journalists_full
    case featured_video_left_5s_5p
    case featured_image_left_9s_6p
    case full
    case default_mode = "default"
    case minute_full_width
}


enum HomeScreenComponent1 {
    case homepageMiddleNineStoriesState(String, String, [LandingModelComponent])
}

//enum ComponentModes : Equatable{
//    case homepageMiddleNineStoriesState(HomepageMiddleNineStoriesAndFivePicsState)
//    case homepageListingSevenStoriesFivePicsState(HomepageListingSevenStoriesFivePicsState)
//    case homepageDynamicListingFourSFourPState(HomepageDynamicListingFourSFourPState)
//    case homepageListingTwoStoriesTwoPicsState(HomepageListingTwoStoriesTwoPicsState)
//    
//    case homePageVideoListState(HomePageVideoListState)
//    case homepageNineStoriesSixPixelState(NineStoriesSixPixelState)
//    case homepageJournalistsCarouselState(journalistsCarouselState)
//    
//    case homepageMiddleEightStoriesSixPicsState(HomepageMiddleEightStoriesAndSixPicsState)
//    case homepageListingFiveStoriesFivePicsState(HomepageLeftFiveStoriesAndFivePicsState)
//    case trendingCrouselState(CarouselDynamicViewState)
//    
//    case homePageSubsciptionState(SubscriptionState)
//    case homePageSpotLightState(SpotlightState)
//    case homePageMinuteCarouselState(MinuteImageCarouselState)
//}
