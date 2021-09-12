//
//  Spotlight.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 17/08/21.
//

import SwiftUI
import Kingfisher
import ComposableArchitecture

struct SpotlightView: View {
    let spotlightStore: Store<SpotlightState, SpotlightAction>
    
    var body: some View {
        WithViewStore(spotlightStore) { viewStore in
            VStack {
            KFImage(viewStore.state.imageMediaMobile.url)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width-30)
                .onTapGesture {
                    viewStore.send(.onTap(false))
                }
            } .frame(width: UIScreen.main.bounds.width-30)
        }
    }
}

//struct Spotlight_Previews: PreviewProvider {
//    static var previews: some View {
//        SpotlightView(spotlightStore: Store(initialState: SpotlightState(imageMediaMobile: "https://res.cloudinary.com/onecms-dev/image/upload/v1610561296/mediacorp/tdy/images/2021-01/screenshot_2021-01-13_at_11.35.51_pm.png", viewMoreUrl: "https://www.todayonline.com/", viewMoreUrlFieldId: nil, viewMoreUrlFieldType: nil,isWebViewPresented: false), reducer: spotlightReducer, environment: SpotlightEnvironment()))
//    }
//}
//


