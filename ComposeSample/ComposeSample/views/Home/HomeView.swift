//
//  HomeView.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 19/08/21.
//

//enum ViewModes  : String {
//    case full
//    case default_mode = "default"
//}

import SwiftUI
import ComposableArchitecture
struct HomeView: View {
    let store: Store<HomeViewState, HomeViewAction>
    var body: some View {
        WithViewStore(self.store) { viewstore in
            List {
                ForEach(0..<viewstore.homeScreenData.loadedComps.count, id: \.self) { index in
                switch (viewstore.homeScreenData.loadedComps[index]){
                    case .TopStories(_,_):
                        let childSatate = topStoriesMapper(homeScreenComponent: viewstore.homeScreenData.loadedComps[index])
                        HomepageMiddleNineStoriesAndFivePics(store: store.scope(state:{_ in childSatate}, action: HomeViewAction.homepageMiddleNineStoriesAndFivePicsActions)).listRowInsets(EdgeInsets())
                    case .spotlight(_,_,_ ):
                        let childSatate = mapSpotlight(homeScreenComponent: viewstore.homeScreenData.loadedComps[index])
                        SpotlightView(spotlightStore: store.scope(state: {_ in childSatate}, action: HomeViewAction.homePageSpotlightActions))
                    case .other:
                        Text("Other")
                }
            }
                Text("Load...").onTapGesture{
                    print(viewstore.state.homeScreenData.lazyComps.lazyComponents.count)
                    if viewstore.state.homeScreenData.lazyComps.lazyComponents.count > 0 {
                        viewstore.send(.LoadNext)
                    }
                   
                }.background(Color.red)
            }
    }
    }
}
//enum it: Equatable {
//    case one(String)
//    case two(Int)
//    case three(String, String)
//}


enum it:Equatable {
    case TopStories(String,[Article])
    case spotlight(String,String,CTAData)
}
