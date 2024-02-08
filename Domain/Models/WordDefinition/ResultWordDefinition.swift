//
//  ResultWordDefinition.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 08/02/24.
//

import Foundation

public struct ResultWordDefinition {
    public let title: String
    public let phonetic: String
    public let audioURLStr: String
    public let definitions: [ResultDefinition]
    
    public init(title: String, phonetic: String, audioURLStr: String, definitions: [ResultDefinition]) {
        self.title = title
        self.phonetic = phonetic
        self.audioURLStr = audioURLStr
        self.definitions = definitions
    }
}

public struct ResultDefinition: Hashable {
    public let partOfSpeech: String
    public let definition: String
    public let example: String
    
    public init(partOfSpeech: String, definition: String, example: String) {
        self.partOfSpeech = partOfSpeech
        self.definition = definition
        self.example = example
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(partOfSpeech)
        hasher.combine(definition)
        hasher.combine(example)
    }
}
