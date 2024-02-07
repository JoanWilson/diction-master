//
//  GetWordDefinitionsDTO.swift
//  Domain
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Foundation

public struct GetWordDefinitionsDTO {
    public let word: String
    public let language: String
    
    public init(word: String, language: String) {
        self.word = word
        self.language = language
    }
}
