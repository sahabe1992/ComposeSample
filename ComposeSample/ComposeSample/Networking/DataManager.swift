//
//  DataManager.swift
//  CcomposeAPISample
//
//  Created by Srijan on 27/08/21.
//

import Foundation
class DataManager {
    let landingRepo:  LandingPageRepository
    init( landingPageRepository: LandingPageRepository = LandingPageRepository()) {
        self.landingRepo = landingPageRepository
    }
}
