//
//  Repository.swift
//  CcomposeAPISample
//
//  Created by Srijan on 27/08/21.
//

import Foundation
import ComposableArchitecture

class LandingPageRepository {
    func getAll() -> Effect<LandingPageModel, ProviderError>  {
        Provider.shared.getLandingPage().eraseToEffect()
    }
    
    func getComponentData(id : String, viewMode: String) -> Effect<LandingComponent, ProviderError>{
        Provider.shared.getLandingComponent(id: id, viewMode: viewMode).eraseToEffect()
    }
}
