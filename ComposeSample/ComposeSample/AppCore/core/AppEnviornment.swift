//
//  AppEnviornment.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation
import ComposableArchitecture

struct AppEnvironment {
    var getLandingData : ()-> Effect<[LandingModelComponent],ProviderError>
    var getComponentData : (LazyComponent) -> Effect<MyComponent, ProviderError>
    var mainQueue: AnySchedulerOf<DispatchQueue>
}
