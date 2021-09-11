//
//  ProfileView.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 19/08/21.
//

import SwiftUI
import ComposableArchitecture

struct ProfileView: View {
    let store: Store<ProfileViewState, ProfileViewAction>
    var body: some View {
        WithViewStore(self.store) { viewstore in
            Text(viewstore.title)
        }
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(store: Store(initialState: ProfileViewState(title: "Profile"), reducer: ProfileViewReducer, environment: ProfileViewEnvironment.init()))
    }
}
