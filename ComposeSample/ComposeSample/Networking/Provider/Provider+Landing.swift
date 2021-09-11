//
//  Provider+Section.swift
//  itodayetp (iOS)
//
//  Created by chanchal.kumari on 06/08/21.
//

import Foundation
import Combine

extension Provider {
    func getLandingPage() -> AnyPublisher<LandingPageModel, ProviderError>{
        var request = URLRequest(url: Router.getLandingPage().url!)
        request.httpMethod = "GET"
        return requestPublisher(request)
  }
    
    func getLandingComponent(id: String, viewMode : String) -> AnyPublisher<LandingComponent, ProviderError>{
        var request = URLRequest(url: Router.getComponentPage(id: id, viewMode: viewMode).url!)
        request.httpMethod = "GET"
        return requestPublisher(request)
    }
}
