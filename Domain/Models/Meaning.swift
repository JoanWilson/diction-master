//
//  Meaning.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 03/02/24.
//

import Foundation

public struct Meaning: Codable {
    public let partOfSpeech: String
    public let definitions: [Definition]
}
