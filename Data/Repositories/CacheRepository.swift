//
//  CacheStorage.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain

public protocol CacheRepository {
    func save(_ word: String, wordDefinition: WordDefinition)
    func get(_ word: String) -> WordDefinition?
}
