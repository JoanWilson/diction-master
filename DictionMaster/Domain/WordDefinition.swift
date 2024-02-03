//
//  WordDefinition.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 02/02/24.
//

import Foundation

public struct WordDefinition: Codable {
    let word: String
    let phonetic: String
    let phonetics: [Phonetic]
    let origin: String
    let meanings: [Meaning]
}
