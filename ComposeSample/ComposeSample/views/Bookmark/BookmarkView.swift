//
//  BookmarkView.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 19/08/21.
//

import SwiftUI
import ComposableArchitecture

struct BookmarkView: View {
    let store: Store<BookmarkViewState, BookmarkViewAction>
    var body: some View {
        WithViewStore(store) { viewstore in
            Text(viewstore.title)
        }
        
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView(store: Store(initialState: BookmarkViewState(title: "Bookmark"), reducer: BookmarkViewReducer, environment: BookmarkViewEnvironment.init()))
    }
}
