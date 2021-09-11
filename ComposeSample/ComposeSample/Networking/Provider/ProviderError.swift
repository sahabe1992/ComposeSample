//
//  ProviderError.swift
//  Meconnect Login
//
//  Created by Srijan on 04/08/21.
//

import Foundation

enum ProviderError: Error, Equatable {
  static func == (lhs: ProviderError, rhs: ProviderError) -> Bool {
    switch (lhs, rhs) {
    case (.network(let lhsError), .network(let rhsError)):
      return ErrorUtility.areEqual(lhsError, rhsError)
    case (.decoding(let lhsError), .decoding(let rhsError)):
      return ErrorUtility.areEqual(lhsError, rhsError)
    case (.encoding(let lhsError), .encoding(let rhsError)):
      return ErrorUtility.areEqual(lhsError, rhsError)
    case (.error(let lhsError), .error(let rhsError)):
      return ErrorUtility.areEqual(lhsError, rhsError)
    default: return false
    }
  }

  case network(error: Error)
  case decoding(error: Error)
  case encoding(error: Error)
  case error(error: Error)
  case notFound
}
