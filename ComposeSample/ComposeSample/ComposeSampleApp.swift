//
//  ComposeSampleApp.swift
//  ComposeSample
//
//  Created by Sahabe.Alam on 11/09/21.
//

import SwiftUI
import ComposableArchitecture
@main
struct ComposeSampleApp: App {
    let dataManager = DataManager()
    var body: some Scene {
        WindowGroup {
            AppView(store: Store(initialState: AppState(loadingState: LoadingState.Loading, sections: SectionsViewState(title: "Section"), bookmark: BookmarkViewState(title: "Bookmark"), profile: ProfileViewState(title: "Profile")), reducer: appRedducer, environment: AppEnvironment(getLandingData: dataManager.landingRepo.getAll, getComponentData: dataManager.landingRepo.getComponentData(id:viewMode:), mainQueue: .main)), currentTab: .home)
        
    }
}
}
