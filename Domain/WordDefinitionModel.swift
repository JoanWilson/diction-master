//
//  WordDefinitionModel.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 03/02/24.
//

import Foundation

public struct WordDefinitionModel {
    public let word: String
    public let phonetic: String
    public let phonetics: [Phonetic]
    public let origin: String
    public let meanings: [Meaning]
}

public struct Phonetic: Codable {
    public let text: String
    public let audio: String?
}

public struct Meaning: Codable {
    public let partOfSpeech: String
    public let definitions: [Definition]
}

public struct Definition: Codable {
    public let definition: String
    public let example: String
}
