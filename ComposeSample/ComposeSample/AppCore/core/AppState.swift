//
//  AppState.swift
//  NewsCore
//
//  Created by chanchal.kumari on 09/09/21.
//

import Foundation
import ComposableArchitecture
struct AppState: Equatable {
    var loadingState: LoadingState<HomeViewState>
    var home: HomeViewState?{
        get {
            switch loadingState {
            case .loaded(let commentsState):
                return commentsState
                case .NotLoaded(let value):
                return value
            default:
                return nil
            }
        }
        
        set {
            if (newValue == nil){
                loadingState = .Loading
            } else {
                loadingState = .loaded(newValue!)
            }
        }

    }
    
    var sections: SectionsViewState
    var bookmark: BookmarkViewState
    var profile: ProfileViewState
}
