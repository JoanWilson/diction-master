//
//  WordDefinition.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 06/02/24.
//

import Foundation

struct WordDefinition: Codable {
    let word: String?
    let phonetic: String?
    let phonetics: [Phonetic]?
    let origin: String?
    let meanings: [Meaning]?
}

struct Phonetic: Codable {
    let text: String?
    let audio: String?
}

struct Meaning: Codable, Hashable {
    let partOfSpeech: String?
    let definitions: [Definition]?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(partOfSpeech)
        hasher.combine(definitions)
    }
    
    static func == (lhs: Meaning, rhs: Meaning) -> Bool {
        return lhs.partOfSpeech == rhs.partOfSpeech && lhs.definitions == rhs.definitions
    }
}

struct Definition: Codable, Hashable {
    let definition: String?
    let example: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(definition)
        hasher.combine(example)
    }
    
    static func == (lhs: Definition, rhs: Definition) -> Bool {
        return lhs.definition == rhs.definition && lhs.example == rhs.example
    }
}
