//
//  CacheRepositoryMock.swift
//  DataTests
//
//  Created by Joan Wilson Oliveira on 08/02/24.
//

import Domain
import Data

class CacheRepositoryMock: CacheRepository {
    var cache: [String: WordDefinition] = [:]
    
    func save(_ word: String, wordDefinition: WordDefinition) {
        cache.updateValue(wordDefinition, forKey: word)
    }
    
    func get(_ word: String) -> WordDefinition? {
        return cache[word]
    }
}
