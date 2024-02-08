//
//  Definition.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public struct Definition: Codable, Hashable {
    public let definition: String?
    public let example: String?
    
    public init(definition: String?, example: String?) {
        self.definition = definition
        self.example = example
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(definition)
        hasher.combine(example)
    }
    
    public static func == (lhs: Definition, rhs: Definition) -> Bool {
        return lhs.definition == rhs.definition && lhs.example == rhs.example
    }
}
