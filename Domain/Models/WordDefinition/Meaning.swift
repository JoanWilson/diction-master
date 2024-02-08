//
//  Meaning.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public struct Meaning: Codable, Hashable {
    public let partOfSpeech: String?
    public let definitions: [Definition]?
    
    public init(partOfSpeech: String?, definitions: [Definition]?) {
        self.partOfSpeech = partOfSpeech
        self.definitions = definitions
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(partOfSpeech)
        hasher.combine(definitions)
    }
    
    public static func == (lhs: Meaning, rhs: Meaning) -> Bool {
        return lhs.partOfSpeech == rhs.partOfSpeech && lhs.definitions == rhs.definitions
    }
}
