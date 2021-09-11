//
//  SectionsView.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 19/08/21.
//

import SwiftUI
import ComposableArchitecture
struct SectionsView: View {
    let store: Store<SectionsViewState, SectionsViewAction>
    
    var body: some View {
        WithViewStore(store) { viewstore in
            Text("HI")
        }
    }
}

struct SectionsView_Previews: PreviewProvider {
    static var previews: some View {
        SectionsView(store: Store(initialState: SectionsViewState(title: "Sections"), reducer: SectionsViewReducer, environment: SectionsViewEnvironment.init()))
    }
}
