//
//  Optional+Ext.swift
//  itodayetp (iOS)
//
//  Created by Srijan on 05/08/21.
//

import Foundation

extension Optional {
    func or(_ value: Wrapped) -> Wrapped {
        switch self {
        case .none:
            return value
        case .some(let wrapped):
            return wrapped
        }
    }
}
extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
