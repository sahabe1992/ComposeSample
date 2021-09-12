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
            HomeViewEnvironment(getLandingData: environment.getLandingData, getComponentData: environment.getComponentData, mainQueue: .main)
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
                    try! result.get().filter({$0.type != "ad_display"})
                )
            })
        case .landingPageFetched(let landinngComponents):
            print(landinngComponents)
            let c :[LazyComponent] = landinngComponents.map { model in
                LazyComponent(uuid: model.uuid, viewMode: model.viewMode, type: model.viewComponnentTypeType)
            }
            state.loadingState = LoadingState.NotLoaded(HomeViewState.init(homeScreenData: HomeScreenData(loadedComps: [], lazyComps: LazyComponentHolder.init(lazyComponents: c))))
            return .init(value: .fetchComponentDetail(c.first!, c))
        case .fetchComponentDetail(let lazyComponent, let list):
            return env
                .getComponentData(lazyComponent)
                .receive(on: env.mainQueue)
                .catchToEffect({
                    result in
                    AppAction.firstComponentFetched(
                        try! result.get(),list
                    )
                })
            case .firstComponentFetched(let data, var lazyList):
                var lazitems = lazyList
                lazitems.removeFirst()
                state.loadingState = LoadingState.loaded(HomeViewState.init(homeScreenData: HomeScreenData.init(loadedComps: [data], lazyComps: LazyComponentHolder.init(lazyComponents: lazitems))))
            return .none
        default: return .none
        }
    })


