//
//  Meaning.swift
//  DictionMaster
//
//  Created by Joan Wilson Oliveira on 02/02/24.
//

import Foundation

struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
}
