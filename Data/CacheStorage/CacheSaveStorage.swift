//
//  CacheSaveStorage.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain

public protocol CacheSaveStorage {
    func save(_ word: String, wordDefinition: WordDefinition)
}
