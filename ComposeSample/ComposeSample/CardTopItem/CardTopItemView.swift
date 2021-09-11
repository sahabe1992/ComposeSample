//
//  CardTopItem.swift
//  itodayetp (iOS)
//
//  Created by chanchal.kumari on 13/08/21.
//




import SwiftUI
import ComposableArchitecture

struct CardTopItemView: View {
    let store: Store<CardTopViewState, CardTopViewAction>
    var isDarkTheme : Bool = false
    
    var body: some View {
        WithViewStore(store, content: { viewStore in
            LazyVStack(alignment: .leading, spacing: 10)
            {
                ImageWithOverlay(imageOverelayState: ImageWithOverlayState(imageUrl: viewStore.imageURL, overlayText: viewStore.overlayText)).if(viewStore.state.type == .video) { view in
                    view.overlay(VideoImageOverlay(),alignment:.bottomLeading)
                }
                
                Text(viewStore.title.stripOutHTML())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .modifier(CustomTextModifier(font: Fonts.graphikSemibold.font(size: 21).weight(.semibold), fontColor: isDarkTheme ? .whited4d4d4 : .black, align: .leading, isVertical: true, paddingEdges: .top, paddingSize: 0,lineSpacing: 2))

                Text(viewStore.state.brief.stripOutHTML()).modifier(ParagraphM(foregroundColor: isDarkTheme ? .whited4d4d4 : .black))

                if(viewStore.authorBookmarkShareState != nil)
                {
                    AuthorTimeBookmarkView(store: store.scope(state: \.authorBookmarkShareState!, action: CardTopViewAction.bookMarkShareActions))
                }

                
            }.padding(.horizontal,15)
            .frame(width: UIScreen.main.bounds.width)
        })
    }
}

struct CardTopItemView_Previews: PreviewProvider {
    static var previews: some View {
        CardTopItemView(store: Store(initialState: CardTopViewState(id: 0, imageURL: "newyork", title: "Former site of Mediacorp’s Caldecott Broadcast Centre sold for S$280.9 million", brief: "SINGAPORE — Phase Three of Singapore’s gradual reopening will begin in two weeks’ time, on Dec 28, Prime Minister Lee Hsien Loong announced in a televised address on Monday (Dec 14).", overlayText: "overlayText/Today", type: .video, authorBookmarkShareState: AuthorTimeBookmarkState(authorName: "By Henk Fortuin", since: "2 hours ago",isBookMarked: true, videoDuration: "5 mints", id: 0)), reducer: CardTopViewReducer, environment: CardTopViewEnvironment(UpdateBookmark: { _ in
            return .none
        })))
    }
}
