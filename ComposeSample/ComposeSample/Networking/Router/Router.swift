//
//  Router.swift
//  Meconnect Login
//
//  Created by Srijan on 04/08/21.
//

import Foundation

struct Route {
  let path: String
  let queryItems: [URLQueryItem]?

  init(path: String, queryItems: [URLQueryItem]? = nil) {
    self.path = path
    self.queryItems = queryItems
  }

  var url: URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "mediacorptdystg.prod.acquia-sites.com"
    components.path = path
    components.queryItems = queryItems
    print(components.url)
    return components.url
  }
}

struct Router {}

extension String {
    var urlEncoded: String? {
        let allowedCharacterSet = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "~-_.?"))
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)
    }
}
