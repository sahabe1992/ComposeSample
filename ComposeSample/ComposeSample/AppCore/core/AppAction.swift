//
//  AppAction.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation
import ComposableArchitecture


enum AppAction {
    case home(HomeViewAction)
    case profile(ProfileViewAction)
    case sections(SectionsViewAction)
    case bookmark(BookmarkViewAction)
    case getLandingPage
    case landingPageFetched([LandingModelComponent])
    case fetchComponent(Result<LandingComponent,ProviderError>)
    case fetchComponentDetail(LazyComponent,[LazyComponent])
    case firstComponentFetched(MyComponent,[LazyComponent])
    
}
