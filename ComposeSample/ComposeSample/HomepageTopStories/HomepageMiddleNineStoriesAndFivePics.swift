//
//  HomepageTopStories.swift
//  TodayOnline
//
//  Created by Srijan on 02/09/21.
//

import SwiftUI
import ComposableArchitecture

struct HomepageMiddleNineStoriesAndFivePics: View {
    let store: Store<HomepageMiddleNineStoriesAndFivePicsState, HomepageMiddleNineStoriesAndFivePicsAction>
    var body: some View {
        WithViewStore(self.store) { viewstore in
            VStack {
                CardTopItemView(store: Store(initialState: viewstore.state.topStory,
                                             reducer: CardTopViewReducer,
                                             environment: CardTopViewEnvironment(UpdateBookmark: { _ in return .none })
                            )
                )
                storiesList(list: viewstore.state.stories, withImage: true) // withImage
            }.onAppear{
                viewstore.send(.viewAppeared)
            }
        }
    }
}

extension HomepageMiddleNineStoriesAndFivePics {
    @ViewBuilder
    private func storiesList(list : IdentifiedArrayOf<CardItemState>, withImage : Bool) -> some View {
        ForEachStore(store.scope(state: {_ in list}, action: HomepageMiddleNineStoriesAndFivePicsAction.cardListItemActions(id:  action: )))
        { cardListItemStore in
            CardItemView( store: cardListItemStore)
        }
    }
}

