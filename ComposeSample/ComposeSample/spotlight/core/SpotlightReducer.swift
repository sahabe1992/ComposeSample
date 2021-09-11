//
//  SpotlightReducer.swift
//  TodayOnline
//
//  Created by gaurav.mishra on 09/09/21.
//

import Foundation
import ComposableArchitecture
let spotlightReducer = Reducer<SpotlightState, SpotlightAction, SpotlightEnvironment>.init {state, action, env in
    switch(action){
    case .onTap(let isPresent):
        state.isWebViewPresented = isPresent
        return .none
    }
}
