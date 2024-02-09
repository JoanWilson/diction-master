//
//  WordDefinitionsMock.swift
//  DataTests
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain

enum ModelMocks {
    static func makeWordDefinitionsDTO(word: String) -> GetWordDefinitionsDTO {
        return GetWordDefinitionsDTO(word: "hello", language: "en")
    }
    
    static func makeWordDefinitionsResponse(word: String) -> [WordDefinition] {
        return [
            WordDefinition(
                word: word,
                phonetic: word,
                phonetics: [],
                origin: word,
                meanings: []
            )
        ]
    }
}
