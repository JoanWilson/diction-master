//
//  WordDefinition.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public struct WordDefinition: Codable {
    public let word: String?
    public let phonetic: String?
    public let phonetics: [Phonetic]?
    public let origin: String?
    public let meanings: [Meaning]?
    
    public init(word: String?, phonetic: String?, phonetics: [Phonetic]?, origin: String?, meanings: [Meaning]?) {
        self.word = word
        self.phonetic = phonetic
        self.phonetics = phonetics
        self.origin = origin
        self.meanings = meanings
    }
}
