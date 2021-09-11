//
//  AuthorTimeBookmarkEnviornment.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation
import ComposableArchitecture

struct AuthorTimeBookmarkEnviornment {
    var UpdateBookmark : (_ body: [String:Any]) -> Effect<Bool, Never>
    var mainQueue: AnySchedulerOf<DispatchQueue>
}
