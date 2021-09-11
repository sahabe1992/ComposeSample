//
//  CardItem.swift
//  itodayetp (iOS)
//
//  Created by chanchal.kumari on 12/08/21.
//

import SwiftUI
import ComposableArchitecture
import Kingfisher

struct CardItemView: View {
    
    var isDarkTheme : Bool = false
    
    let store: Store<CardItemState, CardItemViewAction>

    var body: some View {
        WithViewStore(store, content: { viewStore in
            ZStack {
                HStack(alignment: .top) {
                    switch (viewStore.state.imageItemState){
                    case .NoImage:
                        EmptyView()
                    case .Image(let url):
                            ImageWithOverlay(imageOverelayState: ImageWithOverlayState(imageUrl: url, overlayText: "")).if(viewStore.state.type == .video) { view in
                                view.overlay(VideoImageOverlay(),alignment:.bottomLeading)
                            }
                            .frame(width: UIScreen.screenWidth * 0.3)
                        Spacer()
                    case .placeholder:
                        EmptyView()
                    }
                    VStack(alignment:.leading){
                        Text(viewStore.title.stripOutHTML())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .modifier(CustomTextModifier(font: Fonts.graphikSemibold.font(size: 15).weight(.semibold), fontColor: isDarkTheme ?  .whited4d4d4 : .black , align: .leading, isVertical: true, paddingEdges: .bottom, paddingSize: 10,lineSpacing: 5))
                        
                        if(viewStore.authorBookmarkShareState != nil)
                        {
                            AuthorTimeBookmarkView(store: store.scope(state: \.authorBookmarkShareState!, action: CardItemViewAction.bookMarkShareActions))
                        }
                        
                    }.frame(maxWidth: .infinity)
                }.frame(width: UIScreen.screenWidth-30)
                
            }
            .padding([.horizontal,.top],15)
                        
        .onTapGesture {
            viewStore.send(.onTapCardItem(id: viewStore.state.id, type: viewStore.state.type))
        }
            if(viewStore.state.isDividerShow)
            {
                DeviderList(isDarkTheme: isDarkTheme).padding(.horizontal, 15)
            }
       })
    }
}

struct CardItemView_Previews: PreviewProvider {
    static var previews: some View {
        CardItemView(store: Store(initialState: CardItemState(id: 0, imageUrl: "https://app.zeplin.io/project/5fdffc835f537135a6e06c92/dashboard?tag=Section%20Master%20Landing",imageItemState: ImageItemState.Image("https://res.cloudinary.com/onecms-dev/image/upload/s--6nDlxHxv--/f_auto%2Cq_auto/v1/mediacorp/one-cms/images/2021-03/48053157_527986161038488_5597316532515373056_o.jpg?itok=CVsevqcc"), title: "Former site of Mediacorp’s Caldecott Broadcast Centre sold for S$280.9 million", description: "SINGAPORE — Phase Three of Singapore’s gradual reopening will begin in two weeks’ time, on Dec 28, Prime Minister Lee Hsien Loong announced in a televised address on Monday (Dec 14).", type: .article, authorBookmarkShareState: AuthorTimeBookmarkState(authorName: "By Henk Fortuin", since: "2 hours ago", isBookMarked: true, videoDuration: "5 mints", id: 0, type: .article)), reducer: CardItemReducer, environment: CardItemViewEnvironment(UpdateBookmark: { _ in
            return .none
        })))
    }
}
struct VideoImageOverlay: View {
    var body: some View {
        ZStack {
            Image("play").padding(.all, 5)
        }
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
