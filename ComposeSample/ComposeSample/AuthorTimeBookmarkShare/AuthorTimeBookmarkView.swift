//
//  AuthorTimeBookmarkView.swift
//  itodayetp (iOS)
//
//  Created by chanchal.kumari on 17/08/21.
//

import SwiftUI
import ComposableArchitecture
struct AuthorTimeBookmarkView: View {
    
    let store : Store<AuthorTimeBookmarkState, AuthorTimeBookmarkAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            HStack(alignment: .top){
                VStack{
                    HStack(alignment: .top){
                    
                        VStack(alignment:.leading, spacing:2){
                            if(!viewStore.state.authorName.isEmpty)
                            {
                                Text(viewStore.state.authorName).modifier(CustomTextModifier(font: Fonts.proximaNovaMedium.font(size: 13).weight(.medium), fontColor: .gray636363, align: .leading, isVertical: true, paddingEdges: .bottom, paddingSize: 0, lineSpacing: 0))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            HStack{
                                Text(viewStore.state.since)
                                    .modifier(CustomTextModifier(font: Fonts.proximaNovaMedium.font(size: 13).weight(.medium), fontColor: .gray636363, align: .leading, isVertical: true, paddingEdges: .bottom, paddingSize: 0, lineSpacing: 0))
                                    .frame(alignment: .leading)
                                
                                if(viewStore.state.type == .video)
                                {
                                    Image("videoicon")
                                    Text(viewStore.state.videoDuration)
                                        .modifier(CustomTextModifier(font: Fonts.proximaNovaMedium.font(size: 13).weight(.medium), fontColor: .gray636363, align: .leading, isVertical: true, paddingEdges: .bottom, paddingSize: 0, lineSpacing: 0))
                                }
                                Spacer()
                            }

                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack{
                            Button(action: {
                                viewStore.send(.bookMarkClicked(id: viewStore.id, isBookMarked: !viewStore.isBookMarked))
                            })
                            {
                                Image(viewStore.state.isBookMarked ? "bookmark_fill" : "bookmark")
                                    .padding(.trailing, 8)
                            }
                            
                            Button(action: {
                                viewStore.send(.shareClicked)
                            }) {
                                Image("share")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct AuthorTimeBookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorTimeBookmarkView(store: Store(initialState: AuthorTimeBookmarkState(authorName: "By HENK FORTUIN", since: "6 Months ago", isBookMarked: true, videoDuration: "5 mints", id: 0, type: .video), reducer: AuthorBookmarkShareReducer, environment: AuthorTimeBookmarkEnviornment(UpdateBookmark:{ _ in
            return .none
        }, mainQueue: .main)))
    }
}
