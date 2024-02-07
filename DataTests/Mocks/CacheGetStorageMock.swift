//
//  CacheStorageMock.swift
//  DataTests
//
//  Created by Joan Wilson Oliveira on 07/02/24.
//

import Domain
import Data

struct CacheGetStorageMock: CacheGetStorage {
    var isFailure: Bool
    
    func get(_ word: String) -> WordDefinition? {
        if isFailure {
           return nil
        } else {
            return makeWordDefinitionsMock(word: word).first
        }
    }
}
