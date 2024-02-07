//
//  WordDefinitionsMock.swift
//  DataTests
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain

func makeWordDefinitionsMock(word: String) -> [WordDefinition] {
    return [
        WordDefinition(
            word: word,
            phonetic: "",
            phonetics: [],
            origin: "",
            meanings: []
        )
    ]
}
