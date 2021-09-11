//
//  Model.swift
//  Meconnect Login
//
//  Created by Srijan on 04/08/21.
//

import Foundation

// MARK: - Landing
struct Landing : Codable, Equatable {
    let result: LandingResult
}

// MARK: - Result
struct LandingResult : Codable, Equatable {
    let title, webview, view_mode: String
    let url: String
    let layout: [Layout]
}

// MARK: - Layout
struct Layout : Codable, Equatable {
    let layout_section: LayoutSection
}

// MARK: - LayoutSection
struct LayoutSection : Codable, Equatable {
    let layoutId: String?
    let background_color: String?
    let component: [Component]
}

// MARK: - Component
struct Component : Codable, Equatable {
    let label: String?
//    let label_display: LabelDisplayUnion = .integer(0)
    let type, uuid, view_mode: String?
    let id: String?
}

enum LabelDisplayUnion {
    case enumeration(LabelDisplayEnum)
    case integer(Int)
}

enum LabelDisplayEnum {
    case visible
}
