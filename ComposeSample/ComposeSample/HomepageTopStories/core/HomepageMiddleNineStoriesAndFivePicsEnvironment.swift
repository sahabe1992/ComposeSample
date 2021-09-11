//
//  HomepageMiddleNineStoriesAndFivePicsEnvironment.swift
//  TodayOnline
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
import ComposableArchitecture
struct HomepageMiddleNineStoriesAndFivePicsEnvironment {
    var UpdateBookmark : (_ body: [String:Any]) -> Effect<Bool, Never>
    var mainQueue: AnySchedulerOf<DispatchQueue>
}
