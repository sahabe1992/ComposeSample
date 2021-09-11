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
                storiesList(list: viewstore.state.storiesWithImage, withImage: true) // withImage
                storiesList(list: viewstore.state.storiesWithoutImage, withImage: false) // withoutImage
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

struct HomepageMiddleNineStoriesAndFivePics_Previews: PreviewProvider {
    static var previews: some View {
        HomepageMiddleNineStoriesAndFivePics(store: homepageMiddleNineStoriesAndFivePicStore)
    }
}



let homepageMiddleNineStoriesAndFivePicStore = Store(initialState: HomepageMiddleNineStoriesAndFivePicsState(topStory: CardTopViewState(id: 0, imageURL: "newyork", title: "Former site of Mediacorp’s Caldecott Broadcast Centre sold for S$280.9 million", brief: "SINGAPORE — Phase Three of Singapore’s gradual reopening will begin in two weeks’ time, on Dec 28, Prime Minister Lee Hsien Loong announced in a televised address on Monday (Dec 14).", overlayText: "overlayText/Today", type: .article, authorBookmarkShareState: AuthorTimeBookmarkState(authorName: "By Henk Fortuin", since: "2 hours ago",isBookMarked: true, videoDuration: "10:00", id: 0)), storiesWithImage: IdentifiedArrayOf<CardItemState>(
    uniqueElements: [
        CardItemState(id: 0,
                                                               imageUrl: "newyork",
                                                               title: "Former site of Mediacorp’s Caldecott Broadcast Centre sold for S$280.9 million",
                                                               description: "SINGAPORE — Phase Three of Singapore’s gradual reopening will begin in two weeks’ time, on Dec 28, Prime Minister Lee Hsien Loong announced in a televised address on Monday (Dec 14).",
                                                               type: .article,
                                                               authorBookmarkShareState: AuthorTimeBookmarkState(authorName: "By Henk Fortuin",
                                                                                                                 since: "2 hours ago",
                                                                                                                 isBookMarked: true,
                                                                                                                 videoDuration: "5 mints",
                                                                                                                 id: 0,
                                                                                                                 type: .article
                                                               )
        ),
         CardItemState(id: 1,
                                                                imageUrl: "newyork",
                                                                title: "Former site of Mediacorp’s Caldecott Broadcast Centre sold for S$280.9 million",
                                                                description: "SINGAPORE — Phase Three of Singapore’s gradual reopening will begin in two weeks’ time, on Dec 28, Prime Minister Lee Hsien Loong announced in a televised address on Monday (Dec 14).",
                                                                type: .article,
                                                                authorBookmarkShareState: AuthorTimeBookmarkState(authorName: "By Henk Fortuin",
                                                                                                                  since: "2 hours ago",
                                                                                                                  isBookMarked: true,
                                                                                                                  videoDuration: "5 mints",
                                                                                                                  id: 0,
                                                                                                                  type: .video
                                                                )
         )
    ]
), storiesWithoutImage : IdentifiedArrayOf<CardItemState>(
    uniqueElements:[])), reducer: HomepageMiddleNineStoriesAndFivePicsReducer, environment: HomepageMiddleNineStoriesAndFivePicsEnvironment(UpdateBookmark: {
        _ in return .none
    }, mainQueue: .main))
