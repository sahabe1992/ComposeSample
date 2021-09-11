
import Foundation

struct LandingLayout: Codable, Equatable {
    let layoutId: String
    let components: [LandingModelComponent]

    enum CodingKeys: String, CodingKey {
        case layoutId
        case component
    }
    
    enum NestedKeys: String, CodingKey {
        case layoutSection = "layout_section"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: NestedKeys.self).nestedContainer(keyedBy: CodingKeys.self, forKey: .layoutSection)
        layoutId = try values.decodeIfPresent(String.self, forKey: .layoutId) ?? ""
        components = try values.decodeIfPresent([LandingModelComponent].self, forKey: .component) ?? []
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: NestedKeys.self)
        var name = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .layoutSection)
        try name.encode(layoutId, forKey: .layoutId)
        try name.encode(components, forKey: .component)
    }
}

extension Array where Element == LandingLayout {
    var components: [LandingModelComponent] {
                var components = [LandingModelComponent]()
        forEach { (layout) in
            components.append(contentsOf: layout.components)
        }
        return components
    }
}
