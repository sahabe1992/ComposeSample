//
//  CardTopItemEnviornment.swift
//  TodayOnline
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation
import ComposableArchitecture

struct CardTopViewEnvironment {
    var UpdateBookmark : (_ body: [String:Any]) -> Effect<Bool, Never>
}
