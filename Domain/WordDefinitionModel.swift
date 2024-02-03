//
//  WordDefinitionModel.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 03/02/24.
//

import Foundation

struct WordDefinitionModel {
    let word: String
    let phonetic: String
    let phonetics: [Phonetic]
    let origin: String
    let meanings: [Meaning]
}

struct Phonetic: Codable {
    let text: String
    let audio: String?
}

struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
}

struct Definition: Codable {
    let definition: String
    let example: String
}
