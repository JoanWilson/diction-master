//
//  CacheGetStorage.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain

public protocol CacheGetStorage {
    func get(_ word: String) -> WordDefinition?
}
