//
//  HomepageMiddleNineStoriesAndFivePicsReducer.swift
//  TodayOnline
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
import ComposableArchitecture
let HomepageMiddleNineStoriesAndFivePicsReducer = Reducer<HomepageMiddleNineStoriesAndFivePicsState, HomepageMiddleNineStoriesAndFivePicsAction, HomepageMiddleNineStoriesAndFivePicsEnvironment>.combine(
    CardTopViewReducer.pullback(state: \.topStory, action: /HomepageMiddleNineStoriesAndFivePicsAction.cardTopActions, environment: { environment in
        CardTopViewEnvironment(UpdateBookmark: environment.UpdateBookmark)
    }),
    CardItemReducer.forEach(state: \.stories, action: /HomepageMiddleNineStoriesAndFivePicsAction.cardListItemActions(id: action:), environment: {
        environment in
        CardItemViewEnvironment(UpdateBookmark: environment.UpdateBookmark)
      }
    ), .init{
    state, action, environment in
    switch action{
    case .viewAppeared:
        state.topStory =  CardTopViewState(id: 0, imageURL: "newyork", title: "Former site of Mediacorp’s Caldecott Broadcast Centre sold for S$280.9 million", brief: "SINGAPORE — Phase Three of Singapore’s gradual reopening will begin in two weeks’ time, on Dec 28, Prime Minister Lee Hsien Loong announced in a televised address on Monday (Dec 14).", overlayText: "overlayText/Today", type: .article, authorBookmarkShareState: AuthorTimeBookmarkState(authorName: "By Henk Fortuin", since: "2 hours ago",isBookMarked: true, videoDuration: "10:00", id: 0))
        
        state.stories = IdentifiedArrayOf<CardItemState>(
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
        )
        return .none
    case .cardListItemActions(id: let id , action: _):
        return .none
    case .cardTopActions(_):
        return .none
    }
}
)
