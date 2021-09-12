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
    switch action {
        case .LoadNext:
             return environment
                .getComponentData(state.homeScreenData.lazyComps.lazyComponents.first!)
                .receive(on: environment.mainQueue)
                .catchToEffect({
                    result in
                    HomeViewAction.NextComponentLoaded(try! result.get())
                   
                })
        case .NextComponentLoaded(let component):
            print(component)
            state.homeScreenData.lazyComps.lazyComponents.removeFirst()
            state.homeScreenData.loadedComps.append(component)
            return .none
        case .homepageMiddleNineStoriesAndFivePicsActions(_):
            return .none
        case .homePageSpotlightActions(_):
            return .none
    }
}
