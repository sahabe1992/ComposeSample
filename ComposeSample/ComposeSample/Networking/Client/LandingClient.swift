//
//  LandingClient.swift
//  Meconnect Login
//
//  Created by Srijan on 04/08/21.
//

import Foundation
import ComposableArchitecture
struct LandingClient {
    var getLandingPage:(
    ) -> Effect<LandingPageModel, ProviderError>
    
    var getComponent : (String, String) -> Effect<LandingComponent, ProviderError>
}

extension LandingClient {
    static let live = LandingClient {
        Provider.shared.getLandingPage().eraseToEffect()
    } getComponent: {
        id, viewMode in
        Provider.shared.getLandingComponent(id: id, viewMode: viewMode).eraseToEffect()
    }
}
