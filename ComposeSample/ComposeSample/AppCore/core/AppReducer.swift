//
//  AppCore.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 19/08/21.
//

import Foundation
import ComposableArchitecture

let appRedducer : Reducer<AppState, AppAction, AppEnvironment> = .combine(
    homeViewReducer.optional().pullback(
        state: \.home,
        action: /AppAction.home,
        environment:  { environment in
            HomeViewEnvironment(getLandingData: environment.getLandingData, mainQueue: .main)
        }
    ),
    SectionsViewReducer.pullback(
        state: \.sections,
        action: /AppAction.sections,
        environment:  { environment in
            SectionsViewEnvironment()
        }
    ),
    BookmarkViewReducer.pullback(
        state: \.bookmark,
        action: /AppAction.bookmark,
        environment:  { environment in
            BookmarkViewEnvironment()
        }
    ),
    ProfileViewReducer.pullback(
        state: \.profile,
        action: /AppAction.profile,
        environment:  { environment in
            ProfileViewEnvironment()
        }
    ),
    .init
    {
        state, action, env in
        switch action {
        case .getLandingPage: return env
            .getLandingData()
            .receive(on: env.mainQueue)
            .catchToEffect({
                result in
                
                AppAction.landingPageFetched(
                    try! result.get().result.layout.components.filter({$0.type != "ad_display"})
                )
            })
        case .landingPageFetched(let landinngComponents):
            print(landinngComponents)
            state.loadingState = LoadingState.loaded(HomeViewState())
            state.compoenents =  landinngComponents
            return .init(value: .fetchComponentDetail)
        case .fetchComponentDetail:
            if let component = state.compoenents.first {
                return env
                    .getComponentData(component.uuid, component.viewMode)
                    .receive(on: env.mainQueue)
                    .catchToEffect()
                    .map(AppAction.fetchComponent)
            }
            
            
            return .none
        case .fetchComponent(.success(let data)):
            state.compoenents.removeFirst()
            return state.compoenents.count > 0 ? .init(value: .fetchComponentDetail) : .none
        case .fetchComponent(.failure(let error)):
            state.compoenents.removeFirst()
            return state.compoenents.count > 0 ? .init(value: .fetchComponentDetail) : .none
        default: return .none
        }
    })
