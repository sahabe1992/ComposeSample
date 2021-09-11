//
//  Router+Login.swift
//  Meconnect Login
//
//  Created by Srijan on 04/08/21.
//

import Foundation

extension Router {
    static func getLandingPage() -> Route {
    return
      Route(
        path: "/api/v2/landing/128471",
        queryItems: nil
      )
  }
    
    static func getComponentPage(id: String, viewMode : String) -> Route {
    return
      Route(
        path: "/api/v2/component/\(id)",
        queryItems: [URLQueryItem(name: "viewMode", value: viewMode)]
      )
  }
}
