//
//  ImageWithOverlayCore.swift
//  itodayetp (iOS)
//
//  Created by chanchal.kumari on 20/08/21.
//
import Foundation
import SwiftUI

struct ImageWithOverlayState {
    var imageUrl : String
    var overlayText : String
    var contentMode : ContentMode = .fit
}

struct OverlayTextState {
    var overlayText : String
}
