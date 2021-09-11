//
//  AppEnviornment.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation
import ComposableArchitecture

struct AppEnvironment {
    var getLandingData : ()-> Effect<LandingPageModel,ProviderError>
    var getComponentData : (String, String) -> Effect<LandingComponent, ProviderError>
    var mainQueue: AnySchedulerOf<DispatchQueue>
}
