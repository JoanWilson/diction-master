//
//  GetWordDefinitionsCache.swift
//  Data
//
//  Created by Joan Wilson Oliveira on 04/02/24.
//

import Domain

public class GetWordDefinitionsCache: GetWordDefinitions {
    
    private let cache: CacheStorage
    
    public init(cache: CacheStorage) {
        self.cache = cache
    }
    
    public func getWordDefinition() async throws -> [WordDefinition] {
        
    }
}
