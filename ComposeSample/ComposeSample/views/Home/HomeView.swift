//
//  HomeView.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 19/08/21.
//

//enum ViewModes  : String {
//    case full
//    case default_mode = "default"
//}

import SwiftUI
import ComposableArchitecture
struct HomeView: View {
    let store: Store<HomeViewState, HomeViewAction>
    
    var body: some View {
        WithViewStore(self.store) { viewstore in
         
            Text("Home")
    }
    }
    
}

