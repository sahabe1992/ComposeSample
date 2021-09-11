//
//  String+Ext.swift
//  Meconnect Login
//
//  Created by Srijan on 03/08/21.
//

import Foundation
struct Regex {
    let regex: NSRegularExpression
    
    init(pattern: String) throws {
        self.regex = try NSRegularExpression(pattern: pattern, options: [])
    }
    
    func matches(_ value: String) -> Bool {
        let range = NSRange(location: 0, length: value.count)
        return regex.firstMatch(in: value, options: [], range: range) != nil
    }
}
extension String {
    public static let empty = ""
    
    var isEmail: Bool {
        let result = try? Regex(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}").matches(self)
        return result ?? false
    }
    
    var isPassword: Bool {
        guard !containsWhitespace else { return false }
        return validPasswordLength && containsSpecialCharacter && containsDigits
    }
    
    var validPasswordLength: Bool {
        return self.count >= 8 && self.count <= 16
    }
    
    var containsSpecialCharacter: Bool {
        self.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) != nil
    }
    
    var containsDigits: Bool {
        return self.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
    }
    
    var containsWhitespace: Bool {
        return self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil
    }
    
    var url: URL {
        URL(string: self) ?? Constants.defaultURL.url
    }
}
extension String {
    func toInt() -> Int {
        return Int(self).or(0)
    }
    func stripOutHTML() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}

extension StringProtocol where Self: RangeReplaceableCollection {
    var removingAllWhitespaces: Self {
        filter(\.isWhitespace.negated)
    }
    mutating func removeAllWhitespaces() {
        removeAll(where: \.isWhitespace)
    }
}
extension Bool {
    var negated: Bool { !self }
}
