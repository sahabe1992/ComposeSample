//
//  HomeViewEnvironment.swift
//  NewsCore
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
import ComposableArchitecture
struct HomeViewEnvironment {
    var getLandingData : ()-> Effect<[LandingModelComponent],ProviderError>
    var getComponentData : (LazyComponent)-> Effect<MyComponent,ProviderError>
    var mainQueue: AnySchedulerOf<DispatchQueue>
//    var UpdateBookmark : (_ body: [String:Any]) -> Effect<Bool, Never>

}

