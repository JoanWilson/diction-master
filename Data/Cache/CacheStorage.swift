//
//  CacheGetData.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 04/02/24.
//

import Domain

public protocol CacheStorage {
    func get(key: String) -> Data
    func save(word: String) -> Data
}
